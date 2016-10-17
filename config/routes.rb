Rails.application.routes.draw do
  root 'site/page#index'
  namespace :site do
	
	  
	  resources :establishments do
	  	
	  	resources :shopping_lists do
	  		resources :product_shopping_lists
	  	end
	  	
	  	resources :products 
	  	get 'continue/:id' => 'shopping_lists#continue'
	  end
	
  end

  namespace :admin do
  	
	  resources :establishments do
	  	resources :products 

	  end
  end

  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
