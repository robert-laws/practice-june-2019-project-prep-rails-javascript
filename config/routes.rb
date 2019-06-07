Rails.application.routes.draw do
  root "static#index"

  # get "/authors", to: "authors#index"

  # get "/authors/:id/books", to: "authors#books_index"

  resources :authors, only: [:index] do
    resources :books, only: [:index]
  end


  # get 'subjects/index'

  # resources :authors, only: [:index, :show]
  # resources :books, only: [:index, :show]
  # resources :subjects, only: [:index]
end
