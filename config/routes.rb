Rails.application.routes.draw do

  root 'user#index'


  # listing
  get '/sell' => "listing#new"
  post '/listing/create' => "listing#create"


  # user registration
  get '/register' => "user#form"
  post '/create_user' => "user#create_user"

  # get '/sendText' => 'home#sendText'

  # api crap
  get '/categories/api' => "category#api"
  get '/categories/:category_name/api' => "listing#api"


  # other user stuff
  post 'user' => "user#login"
  post 'logout' => "user#logout"
  get '/account/track-postings' => "user#track_postings"
  get '/account/view-postings' => "user#view_postings"
  post '/account/update-preferences' => "user#update_preferences"
  post '/account/update-postings' => "user#update_postings"
  post  '/delete/id' => "user#delete_listing"
  post '/update_prefs' => "user#update_prefs"

  get 'account'  => "user#edit"

  get '/buy' => "listing#buy"
  get '/sell' => "listing#sell"
  # match '/home' => 'user#new'
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
