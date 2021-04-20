class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @quizzes = Quiz.all
  end
end
