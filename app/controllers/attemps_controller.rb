class AttempsController < ApplicationController
  def new
    @quiz = Quiz.find(params[:quiz_id])
    @attemp = Attemp.new
    @answer = Answer.new
  end

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @attemp = Attemp.new(attemp_params)
    @attemp.quiz = @quiz
    @attemp.user = current_user
    if @answer.right == true
      @attemp.correct_answers += 1
      @attemp.save
      redirect_to root_path
    else
      @attemp.wrong_answers += 1
      @attemp.save
      redirect_to root_path
    end

    # if @attemp.save
    #   redirect_to root_path
    # else
    #   render "quizzes/show"
    # end
    # if response.update(answer: answer)
    #   head :ok
    # else
    #   render 'answer_error'
    #   # renders /app/views/responses/answer_error.js.erb
    #   # Here you can write some JS to update the DOM and sets an error
    #   # message somewhere.
    # end
  end

  # def add
  #   if @answer.right == true
  #     @attemp.correct_answers += 1
  #   else
  #     @attemp.wrong_answers += 1
  #   end
  #   @attemp.save
  #   redirect_to root
  # end

  private

  def attemp_params
    params.require(:attemp).permit(:score, :correct_answers, :wrong_answers)
  end
end
