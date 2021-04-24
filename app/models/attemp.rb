class Attemp < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :quiz

  # validations
  validates :score, presence: true,
                    numericality: { less_than_or_equal_to: 1, greater_than_or_equal_to: 0 }
  validates :correct_answers, presence: true,
                              numericality: { less_than_or_equal_to: 3, greater_than_or_equal_to: 0 }
  validates :wrong_answers, presence: true,
                            numericality: { less_than_or_equal_to: 3, greater_than_or_equal_to: 0 }
  # [X] A user can answer 3 questions on a quizz
  validates :total_answers, presence: true,
                            numericality: { less_than_or_equal_to: 3, greater_than_or_equal_to: 0 }

  # This method allows us to calculate the score each time we choose an answer.
  def update_score
    self.score = correct_answers.to_f / 3
  end
end
