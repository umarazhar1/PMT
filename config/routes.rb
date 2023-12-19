Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'


  resources :projects#, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  # get 'delete_project', to: 'projects#destroy_a'


  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  # get 'delete_user', to: 'users#destroy_a'


  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'


  resources :bugs, except: [:destroy]
  # Defines the root path route ("/")
  # root "projects#index"
end
