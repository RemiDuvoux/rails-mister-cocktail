Rails.application.routes.draw do
  get '/' => "cocktails#home"
  resources :cocktails, only: [:index, :show, :new, :create]do
    resources :doses, only: [:new, :create, :delete]
  end

end
