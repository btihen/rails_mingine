Landing::Engine.routes.draw do
  get 'home/index'

  root "home#index"
end
