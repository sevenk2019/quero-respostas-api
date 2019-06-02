Rails.application.routes.draw do
    resources :courses
    resources :tags
    resources :answers
    resources :questions
    resources :users
    scope :feed do
        controller :feed do
            get '/' => :index
            get '/tag/:id' => :by_tag
            get '/course/:id' => :by_course
            get '/following/' => :following
        end
    end

    get '/top_users', action: :top_users, controller: :users
    post '/login', action: :auth, controller: :login
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
