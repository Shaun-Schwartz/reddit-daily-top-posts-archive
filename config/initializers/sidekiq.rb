sidekiq_url = Rails.application.config.redis[:url] + Rails.application.config.redis[:sidekiq_path] + '_' + Rails.env
Sidekiq.configure_server do |config|
  config.redis = { url: sidekiq_url }
end

Sidekiq.configure_client do |config|
  config.redis = { url: sidekiq_url }
end
