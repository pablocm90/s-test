Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :quizzes do
    resources :attemps, only: [:create, :show] do
      member do
        patch :up_score
        patch :down_score
      end
    end
  end

  resources :answers
  resources :questions
end
