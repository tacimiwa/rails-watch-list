Rails.application.routes.draw do
  root to: 'lists#index'
  resources :lists, shallow: true do
    resources :bookmarks, only: [:index, :new, :create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
