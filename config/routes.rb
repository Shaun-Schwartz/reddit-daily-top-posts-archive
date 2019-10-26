Rails.application.routes.draw do
  root 'pages#home'
  get '/archive', to: 'reddit_posts#archive'
end
