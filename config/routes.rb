Rails.application.routes.draw do
    resources :courses
    resources :tags
    resources :answers
    resources :questions
    resources :users
    scope :feed do
        controller :feed do
            get '/' => :index
            get '/tag/:tag' => :by_tag
        end
    end
    post '/login', action: :auth, controller: :login
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
