class Question < ApplicationRecord
  # associations
  belongs_to :quiz
  has_many :answers

  # validations
  validates :content, presence: true
end
