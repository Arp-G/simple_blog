Rails.application.routes.draw do
  get "blogs/search"

  resources :blogs do
  	get 'pdf', to: "blogs#get_pdf"
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
