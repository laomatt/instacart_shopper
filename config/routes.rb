Rails.application.routes.draw do
  resources :applicants do 
  	collection do 
	  	get 'create_conf'
	  	get 'thank_you'
		end
  end
  root 'applicants#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
