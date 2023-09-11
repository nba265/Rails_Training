class Student < ApplicationRecord
  validates :name, presence: true

  has_many :grades, dependent: :destroy
  accepts_nested_attributes_for :grades, reject_if: :duplicate_grade?, allow_destroy: true

  def duplicate_grade?(attributes)
    subject = attributes['subject']
    self.grades.any? { |grade| grade.subject == subject }
  end
end
