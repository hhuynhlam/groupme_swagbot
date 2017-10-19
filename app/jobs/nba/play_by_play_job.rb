# frozen_string_literal: true
module NBA
  class PlayByPlayJob < ApplicationJob
    queue_as :default

    def perform
      puts 'Performing Play by Play'
    end
  end
end
