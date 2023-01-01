Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'splash#index'

  resources :splash, only: %i[index]

  resources :users, only: %i[index show new create destroy] do
    resources :categories, only: %i[index new edit show  update create destroy] do
      resources :posts, only: %i[index new edit show update create destroy]
    end
  end

end
