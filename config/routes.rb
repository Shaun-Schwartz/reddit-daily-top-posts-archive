Rails.application.routes.draw do
  root 'reddit_posts#index'
  get '/archive', to: 'reddit_posts#archive'
end
