Rails.application.routes.draw do
  get "blogs/search"

  root "blogs#index"

  resources :blogs do
  	get 'pdf', to: "blogs#get_pdf"
  	get 'csv' ,  to: "blogs#get_csv"
  	resources :comments , only: [:create]
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
