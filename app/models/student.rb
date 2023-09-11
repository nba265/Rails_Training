class Student < ApplicationRecord
  has_many :grades
  validates :phone_number, format: { with: /\A\d{10}\z/, message: 'Invalid phone number' }

  accepts_nested_attributes_for :grades, allow_destroy: true, reject_if: proc { |attributes| attributes['score'].nil? }

end
