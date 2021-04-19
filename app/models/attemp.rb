class Attemp < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :quiz
  has_many :attemp_answers
  has_many :answers, through: :attemp_answers

  # validations
  validates :score, numericality: { less_than_or_equal_to: 1, greater_than_or_equal_to: 0 }
  validates :answered_questions, presence: true,
                                 numericality: { less_than_or_equal_to: 3, greater_than_or_equal_to: 0 }

  # private
  # def up
  #   self.answered_questions += 1
  # end
  # Maybe we need to create a column true_answers & false_answers
  # if answer true
  # true_answers += 1
  # else
  # false_answer += 1
  # update score true_answers / 3
end
