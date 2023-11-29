class ExamController < ApplicationController 

  def onboard_candidate
    user_params = get_user_params

    unless valid_params?(user_params)
      render json: { error: 'Invalid or incomplete parameters' }, status: 400
      return
    end

    college = College.find_by(id: user_params[:college_id])
    exam = Exam.find_by(id: user_params[:exam_id], college_id: user_params[:college_id])

    unless college && exam
      render json: { error: 'College or Exam not found' }, status: 400
      return
    end

    unless valid_start_time?(user_params[:start_time], exam)
      render json: { error: 'Requested start time does not fall within the exam\'s time window' }, status: 400
      return
    end

    user = User.new(
      first_name: user_params[:first_name],
      last_name: user_params[:last_name],
      phone_number: user_params[:phone_number],
      exam_id: user_params[:exam_id],
      college_id: user_params[:college_id]
    )

    if user.save 
      render json: { message: "Hi, #{user_params[:first_name]}! All the best for the exam" }, status: 200
    else 
      render json: { error: "Failed to enroll" }, status: 400
    end
  end



  private
  
  def valid_start_time?(start_time, exam)
    exam.exam_windows.exists?('start_time <= ? AND end_time > ?', start_time, start_time)
  end

  def valid_params?(user_params)
    required_params = %i[first_name last_name phone_number college_id exam_id start_time]
    user_params.slice(*required_params).values.all?(&:present?)
  end

  def get_user_params 
    params.require(:user).permit(:first_name, :last_name, :phone_number, :college_id, :exam_id, :start_time)
  end
end