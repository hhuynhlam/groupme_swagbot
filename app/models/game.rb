# frozen_string_literal: true

class Game < ApplicationRecord
  include Mongoid::Document

  field :away_team, type: String
  field :home_team, type: String
  field :nba_id, type: String
  field :scheduled_date, type: Date
  field :scheduled_time, type: DateTime
end
