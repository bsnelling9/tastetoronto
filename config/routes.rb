Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :id
  # Defines the root path route ("/")
  # root "articles#index"
  root "blog_posts#index"

  get '/id', to: 'blog_post#show'
end
