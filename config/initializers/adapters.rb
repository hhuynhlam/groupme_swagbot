# frozen_string_literal: true

GroupMeClient.adapter =
  Faraday.new(url: Settings.group_me.url) do |conn|
    conn.use Faraday::Response::Logger, Rails.logger, bodies: true

    conn.adapter(Faraday.default_adapter)
  end

NBAClient.adapter =
  Faraday.new(url: Settings.nba.url) do |conn|
    conn.use Faraday::Response::Logger, Rails.logger, bodies: true

    conn.adapter(Faraday.default_adapter)
  end

YahooFantasySportsClient.adapter =
  Faraday.new(url: Settings.yahoo_fantasy_sports.url) do |conn|
    conn.use Faraday::Response::Logger, Rails.logger, bodies: true

    conn.adapter(Faraday.default_adapter)
  end
