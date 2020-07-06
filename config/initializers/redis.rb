$redis = Redis.new

if Rails.env=="production"
  url = ENV["REDISCLOUD_URL"]
elsif Rails.env=="development"
  url = "redis://localhost:6379/1"
end

if url
  Sidekiq.configure_server do |config|
    config.redis = { url: url }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: url }
  end
  $redis = Redis.new(:url => url)
end


# if Rails.env.development?
#   TheService.config = ENV['THE_SERVICE_VAR_DEV']
# elsif Rails.env.production?
#   TheService.config = ENV['THE_SERVICE_VAR_PROD']
# end
