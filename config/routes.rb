Rails.application.routes.draw do

  get '/' => 'home#home'

  post '/is-valid-user' => 'authentication#isValidUser'

  get '/user-section' => 'user#userSection'
  get '/create-user' => 'user#create'
  post '/save-user' => 'user#save'
  get '/edit-user/:id' => 'user#edit'
  get '/remove-user/:id' => 'user#remove'
  post '/update-user' => 'user#update'
  get '/list-users' => 'user#list'
  get '/profile' => 'user#profile'
  post '/update-profile' => 'user#updateProfile'
  get '/data-list-users' => 'user#dataListUsers'

  get '/create-project' => 'project#create'
  post '/save-project' => 'project#save'
  get '/edit-project/:id' => 'project#edit'
  post '/update-project' => 'project#update'
  get '/remove-project/:id' => 'project#remove'
  get '/list-projects' => 'project#list'

  get '/create-bug' => 'bug#create'
  post '/save-bug' => 'bug#save'
  get '/edit-bug/:id' => 'bug#edit'
  post '/update-bug' => 'bug#update'
  get '/list-bugs/:id' => 'bug#list'
  post '/save-bug-comment' => 'bug#saveBugComment'
  get '/bug-detail/:id' => 'bug#bugDetail'
  get '/download-bug' => 'bug#downloadBug'
  post '/change-bug-status' => 'bug#changeBugStatus'

  get '/data-list-projects' => 'project#dataListProjects'
  get '/data-list-bugs' => 'bug#dataListBugs'
  get '/data-list-bug-comments' => 'bug#dataListBugComments'

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
