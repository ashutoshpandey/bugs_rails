Rails.application.routes.draw do

  get '/' => 'home#home'

  post '/is-valid-user' => 'authentication#isValiduser'

  get '/user-section' => 'user#userSection'
  get '/create-user' => 'user#createuser'
  post '/save-user' => 'user#saveuser'
  get '/edit-user/:id' => 'user#edituser'
  get '/remove-user/:id' => 'user#removeuser'
  post '/update-user' => 'user#updateuser'
  get '/list-users' => 'user#listusers'
  get '/profile' => 'user#profile'
  post '/update-profile' => 'user#updateProfile'
  get '/data-list-users' => 'user#dataListusers'

  get '/create-project' => 'project#createproject'
  post '/save-project' => 'project#saveproject'
  get '/edit-project/:id' => 'project#editproject'
  post '/update-project' => 'project#updateproject'
  get '/remove-project/:id' => 'project#removeproject'
  get '/list-projects' => 'project#listprojects'

  get '/create-bug' => 'bug#createbug'
  post '/save-bug' => 'bug#savebug'
  get '/edit-bug/:id' => 'bug#editbug'
  post '/update-bug' => 'bug#updatebug'
  get '/list-bugs/:id' => 'bug#listbugs'
  post '/save-bug-comment' => 'bug#savebugComment'
  get '/bug-detail/:id' => 'bug#bugDetail'
  get '/download-bug' => 'bug#downloadbug'
  post '/change-bug-status' => 'bug#changebugStatus'

  get '/data-list-projects' => 'project#dataListprojects'
  get '/data-list-bugs' => 'bug#dataListbugs'
  get '/data-list-bug-comments' => 'bug#dataListbugComments'

  get '/logout' => 'authentication#logout'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase' => as: :purchase

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
  #     resources :comments => :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent' => on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts => concerns: :toggleable
  #   resources :photos => concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
