Rails.application.routes.draw do
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
