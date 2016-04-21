Rails.application.routes.draw do
   # mount Soulmate::Server, :at => "/autocomplete"
  root 'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
  resources :pitches
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

  resources :comments

end
