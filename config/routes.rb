Rails.application.routes.draw do
   #-----------------sessions--------------------
   get    'signup'  => 'users#new'
   get    'login'   => 'sessions#new'
   post   'login'   => 'sessions#create'
   delete 'logout'  => 'sessions#destroy'


   #---------------- results --------------------
   resources :results
   resources :simple_results,  controller: 'results', type: 'SimpleResult' 
   resources :survey_results,  controller: 'results', type: 'SurveyResult'

   #---------------- tasks --------------------
   resources :tasks
   resources :simple_tasks,  controller: 'tasks', type: 'SimpleTask' 
   resources :survey_tasks,  controller: 'tasks', type: 'SurveyTask'
   resources :meeting_tasks, controller: 'tasks', type: 'MeetingTask' 
   resources :social_tasks,  controller: 'tasks', type: 'SocialTask'


   
  
   #-----------------Users--------------------
   resources :users
   get 'users/:id/tasks' => 'tasks#my_tasks'
   #-----------------Surveys--------------------
   resources :surveys

  apipie
   get 'home/index'

 

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

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
