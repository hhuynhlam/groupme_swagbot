# frozen_string_literal: true

module NBA
  class PlayByPlayJob < ApplicationJob
    queue_as :default

    # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
    def perform
      games.each do |game|
        data = NBA::PlayByPlayProxyService.get(game.nba_id)

        periods = data.dig('g', 'pd')
        most_recent_play = periods.last&.dig('pla')&.last

        description = most_recent_play&.dig('de')
        event_id = most_recent_play&.dig('evt')

        next unless most_recent_play && Play.where(event_id: event_id).empty?

        play = Play.create(
          description: description,
          event_id: event_id,
          game: game
        )

        GroupMe::BotProxyService.post(play.group_me_message, play.bot) if play.bot
      end
    end

    private

    def games
      Game.where(scheduled_date: Time.zone.today - 1.day)
          .or(:home_team.in => %w[Lakers Warriors])
          .or(:away_team.in => %w[Lakers Warriors])
    end
  end
end
