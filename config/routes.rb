Rails.application.routes.draw do
  resources :courses
  resources :tags
  resources :answers
  resources :questions
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
