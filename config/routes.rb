Rails.application.routes.draw do
  root to: 'batches#index'

  devise_for :users

  # resources :batches
  # resources :students
  # resources :evaluations

  resources :batches do
    get :question
    resources :students do
      resources :evaluations
    end
  end

  # resources :batches do
  #   resources :students
  # end
  #
  # resources :students do
  #   resources :evaluations
  # end
end
