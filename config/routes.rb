Rails.application.routes.draw do
  resources :codes, only: %i(new show create)

  root 'codes#new'
end
