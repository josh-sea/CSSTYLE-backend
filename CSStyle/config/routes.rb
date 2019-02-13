Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show]
      resources :snippets
      post '/login', to: 'users#login'
      get '/render/:id', to: 'snippets#render_snippet'
    end
  end
end
