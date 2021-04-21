class AttempsController < ApplicationController
  def new
    @quiz = Quiz.find(params[:quiz_id])
    @user = current_user
    @questions = @quiz.questions
    @attemp = Attemp.new
    @attemp_answer = AttempAnswer.new
  end

  def create
    @attemp = Attemp.new(attemp_params)

    if @attemp.save
      redirect_to quiz_path(@quiz)
    else
      render :new
    end
  end

  private

  def attemp_params
    params.require(:attemp).permit(:score, :correct_answers, :wrong_answers)
  end
end
