# frozen_string_literal: true
GroupMeClient.adapter =
  Faraday.new(url: Settings.group_me.url) do |conn|
    conn.adapter(Faraday.default_adapter)
    conn.use Faraday::Response::Logger, Rails.logger, bodies: true
  end

YahooFantasySportsClient.adapter =
  Faraday.new(url: Settings.yahoo_fantasy_sports.url) do |conn|
    conn.adapter(Faraday.default_adapter)
    conn.use Faraday::Response::Logger, Rails.logger, bodies: true
  end
