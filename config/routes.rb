Rails.application.routes.draw do
  resources :products
  #resources :documentos
 
  resources :products do
    collection do
      post :import
    end
  end
  root 'products#index'
end
