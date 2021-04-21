class AttempsController < ApplicationController
  def create
    @quiz = Quiz.find(params[:quiz_id])
    @attemp = Attemp.new(attemp_params)
    @attemp.quiz = @quiz
    @user = current_user
  end

  private

  def attemp_params
    params.require(:attemp).permit(:score, :correct_answers, :wrong_answers)
  end
end
