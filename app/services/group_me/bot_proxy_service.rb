# frozen_string_literal: true
module GroupMe
  class BotProxyService
    def self.post(message)
      path = 'bots/post'

      response = GroupMeClient.create(path, bot_id: Settings.group_me.bot_id,
                                            text: message)

      return false unless response.success?

      true
    end
  end
end
