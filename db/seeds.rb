# frozen_string_literal: true

class Seeds
  class << self
    def call
      seed_games
    end

    private

    def seed_games
      data = load_from_json('2017_2018_schedule')

      data['lscd'].map do |month|
        month.dig('mscd', 'g').map do |game|
          new_game = Game.find_or_create_by(nba_id: game.dig('gid'))

          new_game[:away_team] = game.dig('v', 'tn')
          new_game[:home_team] = game.dig('h', 'tn')
          new_game[:scheduled_date] = game.dig('gdte')

          new_game.save
        end
      end
    end

    def load_from_json(filename)
      JSON.parse(File.read(Rails.root.join('data', "#{filename}.json")))
    end
  end
end

Seeds.call
