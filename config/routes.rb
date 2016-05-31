Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  #post '/rate' => 'rater#create', :as => 'rate'
  post '/rate' => 'rater#create', :as => 'rate'
   # mount Soulmate::Server, :at => "/autocomplete"
  root 'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
  resources :pitches
  resources :child_pitches
  resources :teams

  resources :groups do
    resource :user_groups
    get "add_members" => "user_groups#show"
  end

   resources :statuses do
    member do
      put "like", to: "statuses#like"
      put "unlike", to: "statuses#unlike"
    end
  end
  resources :orders do
    collection do
      get :change_status
    end
  end
  resources :comments
  resources :microposts
end
