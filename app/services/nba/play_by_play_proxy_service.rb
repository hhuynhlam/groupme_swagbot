# frozen_string_literal: true

module NBA
  class PlayByPlayProxyService
    def self.get(game_id)
      path = "json/mobile_teams/nba/2017/scores/pbp/#{game_id}_full_pbp.json"

      response = NBAClient.get(path)

      return false unless response.success?

      JSON.parse(response.body)
    end
  end
end
