Rails.application.routes.draw do
  resources :contacts
  get '/new', to: 'contacts#new'
  get '/contact', to: 'contacts#new'
  root to: 'contacts#new'
end
