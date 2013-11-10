SmartGroups::Application.routes.draw do
  root :to => 'welcome#index'

  # get '/students_grades' => 'teachers#students_grades'

  get "/parser", to: 'parser#index'
  post "/parser", to: 'parser#import'

  get "users/:user_id/courses/:course_id/metrics/:id" => "metrics#main", :as => :main

  resources :metrics
  resources :user_sessions

  resources :users do
    resources :students
    resources :courses do
      put 'num_groups', on: :member
      put 'groups', on: :member
    end
  end

  post '/login' => 'user_sessions#login'
  get '/logout' => 'user_sessions#logout'
  get "/parser", to: 'parser#index'
  post "/parser", to: 'parser#import'

end
