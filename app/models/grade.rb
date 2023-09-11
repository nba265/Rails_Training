class Grade < ApplicationRecord
  enum subject: { math: :math, science: :science, history: :history, literature: :literature }
  belongs_to :student
  validates :subject, presence: true
  validates :score, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :subject, uniqueness: { scope: :student_id, message: "has already been assigned to this student" }

end
