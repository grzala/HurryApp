#by Mikolaj Panasiuk, Grant Christie and Marcel Zak

Rails.application.routes.draw do

  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  post 'users/permissions/:id' => 'users#permissions'
  resources :users
  
  resources :entries, defaults: { format: 'js' }
  
  get 'toilets/map' => 'toilets#map'
  get 'toilets/get_json_all' => 'toilets#get_json_all'
  get 'toilets/get_json_id/:id' => 'toilets#get_json_id'
  get 'toilets/closest' => 'toilets#closest'
  get 'toilets/delete/:id' => 'toilets#delete'
  get 'toilets/:id/:rate' => 'toilets#rate'
  resources :toilets 
  
  post 'comments/create' => 'comments#create'
  get 'comments/edit/:id' => 'comments#edit'
  get 'comments/delete/:id' => 'comments#delete'
  resources :comments

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'toilets#map'

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
