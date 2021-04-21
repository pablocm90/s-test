class AttempsController < ApplicationController
  # def new
  #   @attemp = Attemp.new
  #   @quiz = Quiz.find(params[:quiz_id])
  #   @user = current_user
  #   @questions = @quiz.questions
  #   @attemp_answer = AttempAnswer.new
  # end

  def show
    @attemp = Attemp.find(params[:id])
    @quiz = Quiz.find(params[:quiz_id])
    @user = current_user
    @questions = @quiz.questions
    @attemp_answer = AttempAnswer.new
  end

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @attemp = Attemp.new(attemp_params)
    @attemp.quiz = @quiz
    @attemp.user = current_user

    if @attemp.save
      redirect_to [@quiz, @attemp]
    else
      redirect_to quiz_path(@quiz)
    end
  end

  def update_score
    
  end

  private

  def attemp_params
    params.permit(:score, :correct_answers, :wrong_answers)
  end
end
