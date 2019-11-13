require 'sidekiq/web'
require 'sidekiq-scheduler/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  root 'reddit_posts#index'
  get '/archive', to: 'reddit_posts#archive'
  get '/subreddits', to: 'reddit_posts#subreddits'
end
