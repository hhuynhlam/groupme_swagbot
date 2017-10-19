# frozen_string_literal: true

TEAMS = %w(Warriors Lakers).freeze

schedule_file = File.open("#{Rails.root}/data/2017_2018_schedule.json")

data = JSON.parse(File.read(schedule_file))

game_ids = data['lscd'].map do |month|
  month.dig('mscd', 'g').map do |game|
    home = game.dig('h', 'tn')
    visitor = game.dig('v', 'tn')

    next unless TEAMS.include?(home) || TEAMS.include?(visitor)

    {
      gid: game.dig('gid'),
      date: game.dig('gdte')
    }
  end.compact
end.flatten

File.open("#{Rails.root}/data/2017_2018_game_ids.json", 'w') do |file|
  file.write(JSON.pretty_generate(game_ids))
end
