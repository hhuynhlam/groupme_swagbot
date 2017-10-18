# frozen_string_literal: true

class Settings
  extend Mixlib::Config

  config_context :group_me do
    default(:bot_id, ENV['GROUP_ME_BOT_ID'])
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
