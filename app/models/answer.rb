class Answer < ApplicationRecord
  # associations
  belongs_to :question
  has_many :attemp_answers

  # validations
  validates :content, presence: true
end
