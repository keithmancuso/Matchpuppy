Matchpuppy::Application.routes.draw do
  
  

  
  #static pages
  match 'privacy' => 'pages#privacy'
  match 'terms' => 'pages#terms'
  match 'contact' => 'pages#contact'
  
  
  get "pages/terms"

  resources :park_loves
  resources :comments
  

 match 'account' => 'users#profile'
 match 'account/edit' => 'users#edit'
 
  
  resources :user_sessions
  
   resources :password_resets

  match 'login' => 'user_sessions#new'
  match 'logout' => 'user_sessions#destroy'
  
  resources :playdates do
    resources :playdate_guests
    resources :comments
  end
  
  match 'playdates/:id/join' => 'playdates#join'
  match 'playdates/:id/rsvp/:rsvp' => 'playdates#rsvp'
  
  
  
  
  resources :parks
  
  resources :posts

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
 root :to => 'users#new'
 
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  #match ':controller(/:action(/:id(.:format)))'
  
  resources :users do
    resources :dogs
  end
  
  
  resources :contact_us 
  
  match 'contact_us/send_email' => 'contact_us#send_email', :as => :send_email
   
  
  match 'dogs' => 'dogs#index'
  
  match 'admin/:action' => 'admin'
  
end
