Rails.application.routes.draw do
  devise_for :customers
  resource :customers
  resource :opus
  resource :calendar
  resource :tag
  resource :question
end
