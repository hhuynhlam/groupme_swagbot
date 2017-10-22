# frozen_string_literal: true

require 'clockwork'
require_relative './config/boot'
require_relative './config/environment'

module Clockwork
  PLAY_BY_PLAY_JOB_INTERVAL = ENV['PLAY_BY_PLAY_JOB_INTERVAL_IN_SECONDS'].to_i || 5

  every(
    PLAY_BY_PLAY_JOB_INTERVAL.seconds,
    "nba.play_by_play_job.#{PLAY_BY_PLAY_JOB_INTERVAL}_seconds"
  ) { NBA::PlayByPlayJob.perform_async }
end
