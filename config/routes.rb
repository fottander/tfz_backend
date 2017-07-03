Rails.application.routes.draw do

 devise_for :users, controller: {
    sessions: 'sessions'
}
devise_scope :user do
  authenticated :user do
    root to: 'index#index'
  end
  unauthenticated :user do
    root to: 'devise/sessions#new', as: :unauthenticated_root
  end
end

 resources :news, only: [:index, :show, :new, :create, :destroy, :update, :edit]

 namespace :api do
   namespace :v1 do
     resources :news, only: [:index], defaults: { format: 'json'}
   end
 end
end
