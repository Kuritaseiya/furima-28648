Rails.application.routes.draw do
  devise_for :users
  #root to: 'devise/registrations#new'
  root to: "items#index"
end
