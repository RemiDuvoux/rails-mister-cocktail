Rails.application.routes.draw do
  get '/' => "cocktails#home"
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
    resources :doses, only: [:destroy]
    mount Attachinary::Engine => "/attachinary"
end


