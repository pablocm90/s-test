class Attemp < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :quiz
  has_many :attemp_answers
  has_many :answers, through: :attemp_answers

  # validations
  validates :score, numericality: { less_than_or_equal_to: 1, greater_than_or_equal_to: 0 }
  validates :correct_answers, presence: true,
                              numericality: { less_than_or_equal_to: 3, greater_than_or_equal_to: 0 }
  validates :wrong_answers, presence: true,
                            numericality: { less_than_or_equal_to: 3, greater_than_or_equal_to: 0 }

  def update_score
    self.score = self.correct_answers.to_f / 3
  end
end
