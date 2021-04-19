class Attemp < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :quiz

  # validations
  validates :sucess_rate, numericality: { less_than_or_equal_to: 1, greater_than_or_equal_to: 0 }
  validates :answered_questions, presence: true,
                                 numericality: { less_than_or_equal_to: 3, greater_than_or_equal_to: 0 }
end
