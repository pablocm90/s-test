class AttempsController < ApplicationController
  def show
    @attemp = Attemp.find(params[:id])
    @quiz = Quiz.find(params[:quiz_id])
    @user = current_user
    @questions = @quiz.questions
    # @question = @questions.each
    # We could define @question = @question[0] if total_answers = 0
    # Then @question = question[1] if total_answers = 1
    # ...
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
    @attemp.update_score
    @attemp.save
  end

  private

  def attemp_params
    params.permit(:score, :correct_answers, :wrong_answers)
  end
end
