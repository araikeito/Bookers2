Rails.application.routes.draw do

  get 'home/about'
  # get 'home/top'
# HTTPメソッド(railsだけじゃなくて、インターネット界のルール)
# get: 画面変わります
# post: データ送信します
# HTTPメソッド 'URL' => 'コントローラ名#アクション名'
  # get 'users/:id/edit' => 'users#edit', as: :users_edit
  # get 'users/index'

  devise_for :users
  resources :books
  root to: 'books#top'
  root 'user_images#index'
  resources :users, only: [:new, :create, :index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end