# frozen_string_literal: true
# require 'sidekiq/web'
#
# Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
#   [user, password] == ['admin', Settings.sidekiq.password]
# end
#
# redis_config = {
#   namespace: Settings.redis.namespace,
#   url: Settings.redis.url,
#   master_name: Settings.redis.master_name
# }.compact
#
# Sidekiq.configure_server do |config|
#   config.redis = redis_config
# end
#
# Sidekiq.configure_client do |config|
#   config.redis = redis_config
# end
