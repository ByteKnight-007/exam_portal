# Seed data for colleges
college_names = ['Stanford University', 'University of Tokyo', 'Oxford University', 'MIT', 'Harvard University']
colleges = college_names.map { |name| College.create(name: name) }

# Seed data for exams
exam_data = [
  { exam_name: 'Mathematics Test', start_time_offset: -2.days, end_time_offset: 2.days },
  { exam_name: 'Physics Exam', start_time_offset: -1.day, end_time_offset: 3.days },
  { exam_name: 'Literature Exam', start_time_offset: -3.hours, end_time_offset: 2.days },
  { exam_name: 'Biology Test', start_time_offset: -1.hour, end_time_offset: 1.day },
  { exam_name: 'Computer Science Quiz', start_time_offset: -4.hours, end_time_offset: 1.day },
  { exam_name: 'Chemistry Exam', start_time_offset: -2.days, end_time_offset: 1.day }
]

colleges.each do |college|
  exam_data.each do |exam_info|
    exam = Exam.create(college: college, exam_name: exam_info[:exam_name])
    start_time = Time.now + exam_info[:start_time_offset]
    end_time = Time.now + exam_info[:end_time_offset]
    ExamWindow.create(exam: exam, start_time: start_time, end_time: end_time)
  end
end

