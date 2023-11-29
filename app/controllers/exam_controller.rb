class ExamController < ApplicationController 
  def onboard_candidate
    user_params = get_user_params

    result = process_candidate_onboarding(user_params)

    log_api_request(user_params, result[:response], result[:status_code])

    render json: result[:response], status: result[:status_code]
  end

  

  private

  def process_candidate_onboarding(user_params)
    return { response: { error: 'Invalid or incomplete parameters' }, status_code: 400 } unless valid_params?(user_params)

    college = College.find_by(id: user_params[:college_id])
    exam = Exam.find_by(id: user_params[:exam_id], college_id: user_params[:college_id])

    unless college && exam
      return { response: { error: 'College or Exam not found' }, status_code: 400 }
    end

    unless valid_start_time?(user_params[:start_time], exam)
      return { response: { error: 'Requested start time does not fall within the exam\'s time window' }, status_code: 400 }
    end

    user = build_user(user_params)

    if user.save 
      return { response: { message: "Hi, #{user_params[:first_name].titleize}! All the best for the exam" }, status_code: 200 }
    else 
      return { response: { error: "Failed to enroll" }, status_code: 400 }
    end
  end

  def log_api_request(request_params, response_data, status_code)
    ApiRequest.create(
      request_params: request_params.to_json,
      response: response_data.to_json,
      request_time: Time.now,
      status_code: status_code
    )
  end
  
  def build_user(user_params)
    User.new(
      first_name: user_params[:first_name],
      last_name: user_params[:last_name],
      phone_number: user_params[:phone_number],
      exam_id: user_params[:exam_id],
      college_id: user_params[:college_id],
      start_time: user_params[:start_time]
    )
  end

  def valid_params?(user_params)
    required_params = %i[first_name last_name phone_number college_id exam_id start_time]
    user_params.slice(*required_params).values.all?(&:present?)
  end

  def valid_start_time?(start_time, exam)
    exam.exam_window.where('start_time <= ? AND end_time > ?', start_time, start_time).exists?
  end

  def get_user_params 
    params.permit(:first_name, :last_name, :phone_number, :college_id, :exam_id, :start_time)
  end
end
