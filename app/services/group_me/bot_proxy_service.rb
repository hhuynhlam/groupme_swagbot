# frozen_string_literal: true
module GroupMe
  class BotProxyService
    def self.post(message, bot_name)
      path = 'bots/post'

      response = GroupMeClient.create(path, bot_id: Settings.group_me.bot_id[bot_name],
                                            text: message)

      return false unless response.success?

      true
    end
  end
end
