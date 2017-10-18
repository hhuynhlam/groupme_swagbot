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

  config_context :mongoid do
    default(:uri, ENV['MONGODB_URI'])
  end

  config_context :redis do
    default(:namespace, 'groupme_swagbot')
    default(:uri, ENV['REDIS_URI'])
  end
end
