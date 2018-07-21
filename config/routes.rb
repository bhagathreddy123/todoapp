Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#home"
  get "pages/home", to: "pages#home"
  resources :todos
  resources :recipes
  get  "/about", to: "pages#about"
  get "/help", to: "pages#help"
  get "/signup", to: "chefs#new"
  resources :chefs, except: [:new]
end
