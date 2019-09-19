Rails.application.routes.draw do
  resources :blogs do
    collection do
      post:confirm
    end
  end

  root to: 'blogs#index'
  get '/new', to: 'blogs#new'
  get '/edit', to: 'blogs#edit'

end
