class Quiz < ApplicationRecord
  # associations
  belongs_to :user
  has_many :questions
  has_many :answers, through: :questions
  has_many :attemps

  # validations
  validates :title, presence: true
  validates :category, presence: true
  validates :difficulty, presence: true
end
