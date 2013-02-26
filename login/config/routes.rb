Foodaholic::Application.routes.draw do
  
  get 'sign_up'=>'users#new'
  
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  
  get 'about' => 'pages#about'
  get 'profile' => 'pages#profile'

  resources :users 

  controller :admin do
      get 'recent_approved' => :recent_approved
      get  'unapproved' => :unapproved
      post 'approve' => :approve
      get  'reported' => :reported
  end
  
  controller :posts do
    put 'posts/:id/approve' => :approve
    get 'dessert' => :dessert
    get 'dish' => :dish
    get 'pastry' => :pastry
    get 'appetizer' => :appetizer
    get 'myposts' => :myposts
  end
    

  resources :posts do #, :has_many => :comments, :shallow => true 
    resources :comments
  end

  resources :posts do
    member do
      get 'like'
    end
    resources :ratings
  end
  resources :recipes

  resources :comments do
    resources :comments
  end

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
  # root :to => 'welcome#index'
  root to: 'pages#index', as: 'home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
