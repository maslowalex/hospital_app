Rails.application.routes.draw do
  resources :workers
  resources :hospitals

  resources :workers do
  	put 'remove_from'
  	put 'add_to'
  end

  root to: 'hospitals#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
