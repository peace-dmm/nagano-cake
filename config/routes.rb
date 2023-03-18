Rails.application.routes.draw do
  namespace :admin do
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
end
  #get 'items/new'
  #get 'items/index'
  #get 'items/show'
  #get 'items/edit'
  #get 'items/create'
  #get 'items/update'

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  #devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
