# frozen_string_literal: true
# AdelphicClient.adapter =
#   Faraday.new(url: Settings.adelphic.endpoint) do |conn|
#     conn.basic_auth(Settings.adelphic.username, Settings.adelphic.password)
#     conn.adapter(Faraday.default_adapter)
#     conn.use Faraday::Response::Logger, Rails.logger, bodies: true
#   end
#
# AdelphicReportingClient.adapter =
#   Faraday.new(url: Settings.adelphic.reporting_endpoint) do |conn|
#     conn.basic_auth(Settings.adelphic.username, Settings.adelphic.password)
#     conn.adapter(Faraday.default_adapter)
#     conn.use Faraday::Response::Logger, Rails.logger, bodies: true
#   end
#
# NexusClient.adapter =
#   Faraday.new(url: Settings.nexus_endpoint) do |conn|
#     conn.token_auth(Settings.seat_token)
#     conn.adapter(Faraday.default_adapter)
#     conn.use Faraday::Response::Logger, Rails.logger, bodies: true
#   end
