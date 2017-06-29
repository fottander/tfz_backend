Rails.application.routes.draw do

 root controller: :index, action: :index

 resources :news, only: [:index, :show, :new, :create, :destroy]

 namespace :api do
   namespace :v1 do
     resources :news, only: [:index], defaults: { format: 'json'}
   end
 end
end
