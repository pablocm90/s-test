class AttempsController < ApplicationController
  def show
    @attemp = Attemp.find(params[:id])
    @quiz = Quiz.find(params[:quiz_id])
    @user = current_user
    @questions = @quiz.questions
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
    @attemp.total_answers += 1
    @attemp.update_score
    @attemp.save
    if @attemp.total_answers == 3
      redirect_to quiz_path(@attemp.quiz_id)
    end
  end

  def down_score
    @attemp = Attemp.find(params[:id])
    @attemp.wrong_answers += 1
    @attemp.total_answers += 1
    @attemp.update_score
    @attemp.save
    if @attemp.total_answers == 3
      redirect_to quiz_path(@attemp.quiz_id)
    end
  end

  private

  def attemp_params
    params.permit(:score, :correct_answers, :wrong_answers)
  end
end
