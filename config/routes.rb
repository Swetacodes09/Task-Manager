Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  resources :tasks
  root to: 'tasks#index'
  get "/task/:id", to: "tasks#destroy", as: "task_delete"
end
