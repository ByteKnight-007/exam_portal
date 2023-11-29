Rails.application.routes.draw do
  post '/enroll_candidate', to: 'exam#onboard_candidate'
end
