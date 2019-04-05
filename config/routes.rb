Rails.application.routes.draw do
  get 'welcome/index'
  post 'ratings/new'
  post 'orgs/contact'

  resources :orgs
  resources :ratings

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
