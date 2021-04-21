class AttempAnswersController < ApplicationController
  def create
    @attempt_answer = AttempAnswer.new(attempt_answer_params)
    @attempt_answer.save
  end

  private

  def attempt_answer_params
    params.require(:attempt_answer).permit(:id)
  end
end
