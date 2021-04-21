class Answer < ApplicationRecord
  # associations
  belongs_to :question

  # validations
  validates :content, presence: true
end
