# frozen_string_literal: true

class ResponseFactory
  WAKE = ConstantService.responses(:wake)

  def self.build(options)
    new.build(options)
  end

  def build(command:, bot:)
    return unless bot && command

    case command
    when :playing
      GroupMe::BotProxyService.post(games_message, bot)
    when :wake
      GroupMe::BotProxyService.post(WAKE.sample, bot)
    end
  end

  private

  def games_message
    games.map do |game|
      "#{game.away_team} @ #{game.home_team} (#{game.scheduled_time.strftime('%I:%M %p')})"
    end.join(', ')
  end

  def games
    Game.where(scheduled_date: Time.zone.today)
  end
end
