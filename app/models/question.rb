class Question < ApplicationRecord
  # associations
  belongs_to :quiz
  has_many :answers, dependent: :destroy

  # validations
  validates :content, presence: true
  validates_length_of :answers, maximum: 4 # [X] A question has a maximum of 4 answers
end
