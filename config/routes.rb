Rails.application.routes.draw do
  resources :codes, only: %i(new show create) do
    resources :lines, only: [] do
      resources :comments, only: %i(new destroy create)
    end
  end

  root 'codes#new'
end
