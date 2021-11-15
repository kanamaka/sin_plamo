
Rails.application.routes.draw do
  devise_for :customers, controllers: {
    registrations: "customer/registrations",
    sessions: "customer/sessions"
  }

  devise_scope :customer do
    post 'customer/sign_up/confirm', to: 'customers/registrations#confirm'
    get 'customer/sign_up/complete', to: 'customers/registrations#complete'
  end

  #post 'opus/:id' => 'opus#create'

  scope module: :customer do
   resources :opus do
     resource :favorites, only: [:create, :destroy]
     resource :comments, only: [:create, :destroy]
  end
   resources :tags
   resources :questions do
    resource :answer
   end
   resources :customers
   resources :calendars
   resources :notifications, only: :index
  end
  root :to => "customer/tops#top"
  get "/about" => "customer/tops#about"
  get 'search' => 'posts#search'
  delete 'opud/:id' => 'opus#destroy'
  post 'calendars/:id' => 'calendar#show'
end