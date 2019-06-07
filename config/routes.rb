Rails.application.routes.draw do
  root "static#index"

  # get "/authors", to: "authors#index"

  # get "/authors/:id/books", to: "authors#books_index"

  resources :authors, only: [:index, :new, :create] do
    resources :books, only: [:index]
  end

  resources :books, only: [:show]

  # get "/book-info/:id", to: "books#show"

  # get 'subjects/index'

  # resources :authors, only: [:index, :show]
  # resources :books, only: [:index, :show]
  # resources :subjects, only: [:index]
end
