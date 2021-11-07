Rails.application.routes.draw do
  devise_for :admins, controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }
  devise_for :customers, controllers: {
    registrations: "customer/registrations",
    sessions: "customer/sessions"
  }

  devise_scope :customer do
    post 'customer/sign_up/confirm', to: 'customers/registrations#confirm'
    get 'customer/sign_up/complete', to: 'customers/registrations#complete'
  end
  
  devise_scope :admin do
    post 'admin/sign_up/confirm', to: 'admins/registrations#confirm'
    get 'admin/sign_up/complete', to: 'admins/registrations#complete'
  end
  
  scope module: :customer do
   resource :customers
   resource :opus
   resource :calendar
   resource :tag
   resource :question
  end
  root :to => "customer/tops#top"
  get "/about" => "customer/tops#about"
end
