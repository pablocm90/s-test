class Quiz < ApplicationRecord
  # associations
  has_many :questions
  has_many :answers, through: :questions
  has_many :attemps

  # validations
  validates :title, presence: true
  validates :difficulty, presence: true
end
