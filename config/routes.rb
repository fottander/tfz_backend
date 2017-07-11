Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users
  root controller: :index, action: :index

 resources :news, only: [:index, :show, :new, :create, :destroy, :update, :edit]

 namespace :api do
   namespace :v1 do
     resources :news, only: [:index, :show], defaults: { format: 'json'}
   end
 end
end
