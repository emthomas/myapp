Rails.application.routes.draw do

  resources :song_requests

  resources :pictures

  resources :tables do
    member do
	   get :empty
	end
  end

  root               		'static_pages#home'
  get 		'home'    	=> 	'static_pages#home'
  get 		'about'   	=>  'static_pages#about'
  get		'wedding' 	=>  'static_pages#wedding'
  get		'venue_cost' 	=>  'static_pages#venue_cost'
  get		'our_story' =>  'static_pages#our_story'
  get		'contact_us' =>  'static_pages#contact_us'
  get		'signup'  	=>	'users#new'
  get    	'login'   	=> 	'sessions#new'
  post   	'login'   	=> 	'sessions#create'
  delete 	'logout'  	=> 	'sessions#destroy'
  get       'flip_theme'    =>      'tables#flip_theme'
  post      'twilio/voice'   =>  'twilio#voice'
  post      'twilio/notify'  =>  'twilio#notify'
  get       'coming_guests' => 'users#index_coming'

  resources :users do
  	member do
  		get :activate
  		get :deactivate
  		get :invite
  		get :uninvite
  		get :iscoming
  		get :isnotcoming
  		get :set_is_not_adult
  		get :set_is_adult
        get ':action/:table_id'
        get :untable
  	end
    resources :tables do
        member do
		   get :add_user
		   get :remove_user
        end
		  
     end
  end
  
  resources :guess_who_questions do
  	member do
  		get :save_user_answer
  	end
  end
  
  resources :families do
    member do
        get :untable
  	end
  
	resources :tables do
        member do
		   get :add_family
           get :remove_family
        end
	end
  end
  
  resources :messages do
  	member do
  		get :mark_as_read
  		get :mark_as_unread
  	end
  end
  
  resources :account_activations, only: [:edit]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
