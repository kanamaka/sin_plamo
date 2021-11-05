Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  resource :customers
  resource :opus
  resource :calendar
  resource :tag
  resource :question
  root to: 'tops#top'
end
