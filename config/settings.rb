# frozen_string_literal: true

class Settings
  extend Mixlib::Config

  config_context :group_me do
    config_context :bot_id do
      default(:big_baller, ENV['GROUP_ME_BIG_BALLER_BOT_ID'])
      default(:swag, ENV['GROUP_ME_SWAG_BOT_ID'])
    end

    default(:url, ENV['GROUP_ME_URL'])
  end

  config_context :sidekiq do
    default(:password, ENV['SIDEKIQ_PASSWORD'])
    default(:user, ENV['SIDEKIQ_USER'])
  end

  config_context :yahoo_fantasy_sports do
    default(:oauth_client_id, ENV['YAHOO_FANTASY_SPORTS_OAUTH_CLIENT_ID'])
    default(:oauth_client_secret, ENV['YAHOO_FANTASY_SPORTS_OAUTH_CLIENT_SECRET'])
    default(:oauth_refresh_token, ENV['YAHOO_FANTASY_SPORTS_OAUTH_REFRESH_TOKEN'])
    default(:oauth_token_url, ENV['YAHOO_FANTASY_SPORTS_OAUTH_TOKEN_URL'])

    default(:url, ENV['YAHOO_FANTASY_SPORTS_URL'])
  end

  config_context :mongoid do
    default(:uri, ENV['MONGODB_URI'])
  end

  config_context :redis do
    default(:namespace, 'groupme_swagbot')
    default(:uri, ENV['REDIS_URI'])
  end
end
