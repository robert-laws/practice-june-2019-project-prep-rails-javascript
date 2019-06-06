Rails.application.routes.draw do
  root "static#index"

  get "/authors", to: "authors#index"
end
