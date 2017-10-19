# frozen_string_literal: true
module YahooFantasySportsClient
  cattr_accessor :adapter

  def self.get(path, params = {})
    raise AdapterNotDefinedError, 'yahoo_fantasy_sports' if adapter.nil?

    adapter.get(
      path,
      params,
      accept: 'application/json',
      authorization: "Bearer #{access_token}"
    )
  end

  def self.post(path, body = {})
    raise AdapterNotDefinedError, 'yahoo_fantasy_sports' if adapter.nil?

    adapter.post(
      path,
      body.to_json,
      authorization: "Bearer #{access_token}",
      content_type: 'application/json'
    )
  end

  def self.access_token
    JSON.parse(
      Faraday.post(
        Settings.yahoo_fantasy_sports.oauth_token_url,
        client_id: Settings.yahoo_fantasy_sports.oauth_client_id,
        client_secret: Settings.yahoo_fantasy_sports.oauth_client_secret,
        grant_type: 'refresh_token',
        redirect_uri: 'oob',
        refresh_token: Settings.yahoo_fantasy_sports.oauth_refresh_token
      ).body
    ).with_indifferent_access[:access_token]
  end
end
