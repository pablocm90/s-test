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
    # if @attemp.save
    #   redirect_to dashboard_path
    # else
    #   render "boardgames/show"
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

  private

  def attemp_params
    params.require(:attemp).permit(:score, :answered_questions)
  end
end
