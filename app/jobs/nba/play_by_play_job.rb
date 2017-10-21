# frozen_string_literal: true

module NBA
  class PlayByPlayJob
    include Sidekiq::Worker
    sidekiq_options queue: :default, retry: false

    RECENT_PLAYS_LIMIT = 5

    # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
    def perform
      games.each do |game|
        data = NBA::PlayByPlayProxyService.get(game.nba_id)

        periods = data.dig('g', 'pd')
        recent_plays = periods.last&.dig('pla')&.last(RECENT_PLAYS_LIMIT)

        recent_plays&.each do |play|
          description = play&.dig('de')
          event_id = play&.dig('evt')

          cached_plays = Play.where(event_id: event_id)

          next unless cached_plays.empty?

          play = Play.new(description: description, event_id: event_id, game: game)

          process_play(play) if play.bot
        end
      end
    end

    private

    def games
      Game.where(scheduled_date: Time.zone.today)
          .or(:home_team.in => %w[Lakers Warriors])
          .or(:away_team.in => %w[Lakers Warriors])
    end

    def process_play(play)
      play.save

      GroupMe::BotProxyService.post(play.group_me_message, play.bot)
    end
  end
end
