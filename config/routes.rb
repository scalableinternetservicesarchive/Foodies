Rails.application.routes.draw do
  get 'search/index'
  resources :collections
  get 'homepage/show'
  get 'profile/:id', to: 'profile#show', as: :profile
  get 'search', to: 'search#index'
  get 'search/find_by_recipe', to: 'search#find_by_recipe', as: :search_find_by_recipe
  get 'search/find_by_ingredient', to: 'search#find_by_ingredient', as: :search_find_by_ingredient
  get 'search/find_by_user', to: 'search#find_by_user', as: :search_find_by_user
  get 'tags/:tag', to: 'recipes#tagged', as: :tagged
  resources :masterpieces
  resources :recipes  
  devise_for :users
  post '/recipes/:id/like', to: 'recipes#like', as: :recipe_like
  post '/recipes/:id/unlike', to: 'recipes#unlike', as: :recipe_unlike
  post '/masterpieces/:id/like', to: 'masterpieces#like', as: :masterpiece_like
  post '/masterpieces/:id/unlike', to: 'masterpieces#unlike', as: :masterpiece_unlike
  post '/recipes/:id/bookmark', to: 'recipes#bookmark', as: :recipe_bookmark
  post '/recipes/:id/unbookmark', to: 'recipes#unbookmark', as: :recipe_unbookmark
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # You can have the root of your site routed with "root"
  root 'homepage#show'

  # Errors
  get '404', to: 'errors#not_found'
  get '422', to: 'errors#unacceptable'
  get '500', to: 'errors#internal_server_error'
  get 'errors/security_transgression_error', as: :security_transgression_error

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
