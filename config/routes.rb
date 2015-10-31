Rails.application.routes.draw do
  get 'profile/index'

  resources :masterpieces
  resources :recipes
  resources :profile
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
  root 'recipes#index'

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
