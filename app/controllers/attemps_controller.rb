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
    @question = @questions.each
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

  def up_score
    @attemp = Attemp.find(params[:id])
    @attemp.correct_answers += 1
    @attemp.update_score
    @attemp.save
  end

  def down_score
    @attemp = Attemp.find(params[:id])
    @attemp.wrong_answers += 1
    @attemp.save
  end

  private

  def attemp_params
    params.permit(:score, :correct_answers, :wrong_answers)
  end
end
