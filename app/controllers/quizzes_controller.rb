class QuizzesController < ApplicationController
  def show
    @quiz = Quiz.find(params[:id])
    @title = @quiz.title
    @difficulty = @quiz.difficulty
    @questions = @quiz.questions
    @answer = Answer.new
    @attemp = Attemp.new
  end

  private

  def quiz_params
    params.require(:quiz).permit(:title, :difficulty)
  end
end
