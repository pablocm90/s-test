Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  resources :quizzes do
    resources :attemps
  end

  resources :answers
  resources :questions
end
