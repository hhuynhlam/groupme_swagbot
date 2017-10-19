# frozen_string_literal: true
require 'sidekiq/web'

Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  [user, password] == [Settings.sidekiq.user, Settings.sidekiq.password]
end

redis_config = {
  namespace: Settings.redis.namespace,
  url: Settings.redis.uri
}.compact

Sidekiq.configure_server do |config|
  config.redis = redis_config
end

Sidekiq.configure_client do |config|
  config.redis = redis_config
end
