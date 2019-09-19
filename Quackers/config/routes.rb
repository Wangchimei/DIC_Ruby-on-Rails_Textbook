Rails.application.routes.draw do
  resources :blogs

  root 'blogs#index'

  get '/index',to: 'blogs#index'
  get '/new',to: 'blogs#new'
  get '/edit',to: 'blogs#edit'
end
