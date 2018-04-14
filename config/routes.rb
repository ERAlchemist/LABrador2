Rails.application.routes.draw do
  root 'requests#index'
  resources :schedule 
  resources :requests do
    member do
      patch :close_out, :reopen
    end
    resources :samples do
      collection { post :import }
      member do
        patch :complete , :set_as_empty, :remove_complete, :remove_empty
      end
    end
  end
end
