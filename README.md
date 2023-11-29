# Pre-requisites
* Ruby 3.0.2
* bundler

# Cloning Repository
  git@github.com:hk-cogoport/exam_portal.git

# Ruby Setup
  STEP 1: rvm install ruby-3.0.2

  STEP 2: rvm list

  STEP 3: rvm use ruby-3.0.2

  STEP 5: gem install rails:7.0.8


# Getting Started
  STEP 6: bundle install

  STEP 9: rails db:migrate

  STEP 10: rails db:seed

  STEP 11: rails s

# Making a request

  url = http://127.0.0.1:3000/enroll_candidate

  request_params = {
  "first_name": "Harshit",
  "last_name": "kumar",
  "phone_number": "7654874153",
  "college_id": 1,
  "exam_id": 1,
  "start_time": "2023-11-29 19:51:55.518422518"
}
