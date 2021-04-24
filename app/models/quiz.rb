class Quiz < ApplicationRecord
  # associations
  has_many :questions, dependent: :destroy
  has_many :answers, through: :questions
  has_many :attemps, dependent: :destroy

  # validations
  validates :title, presence: true # [X] A quizz has a Title
  validates_length_of :questions, maximum: 3 # [X] A quizz has a maximum of 3 questions

  DIFFICULTY = ['easy', 'medium', 'hard'] # [X] A quizz can have a dificulty level
  validates :difficulty, presence: true,
                         inclusion: { in: DIFFICULTY }
end
