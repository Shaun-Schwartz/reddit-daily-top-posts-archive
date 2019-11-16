require 'sidekiq/web'
require 'sidekiq-scheduler/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  root 'client#index'

  namespace :api, defaults: {format: :json} do
    resources :reddit_posts
    get '/subreddits', to: 'reddit_posts#subreddits'
  end

end
