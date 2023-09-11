class Grade < ApplicationRecord
  belongs_to :student
  validates :score, presence: true, numericality: { greater_than_or_equal_to: 0,
                                                    less_than_or_equal_to: 10  }
  enum subject: {math: 'Math', literature: 'Literature', physics: 'Physics', chemistry: 'Chemistry'}

end
