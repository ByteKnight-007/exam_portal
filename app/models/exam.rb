class Exam < ApplicationRecord
  belongs_to :college
  has_many :exam_window
end
