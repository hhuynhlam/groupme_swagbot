# frozen_string_literal: true
module YahooFantasySports
  class LeagueProxyService
    def self.get
      path = 'league/nba.l.63351'

      response = YahooFantasySportsClient.get(path)

      return false unless response.success?

      Hash.from_xml(response.body)
        &.()['fantasy_content']
        &.()['league']
        .symbolize_keys
    end
  end
end
