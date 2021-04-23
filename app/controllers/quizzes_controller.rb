class QuizzesController < ApplicationController
  def show
    @quiz = Quiz.find(params[:id])
    @user = current_user
    @questions = @quiz.questions
    @attemps = @quiz.attemps
    @attemp = Attemp.new
  end

  private

  def quiz_params
    params.require(:quiz).permit(:title, :difficulty)
  end
end
