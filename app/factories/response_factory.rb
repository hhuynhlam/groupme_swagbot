# frozen_string_literal: true

class ResponseFactory
  WAKE = ConstantService.responses(:wake)

  def self.build(command:, bot:)
    return unless bot && command

    case command
    when :wake
      GroupMe::BotProxyService.post(WAKE.sample, bot)
    end
  end
end
