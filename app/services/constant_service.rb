# frozen_string_literal: true

class ConstantService
  def self.responses(filename)
    YAML.safe_load(
      File.open(Rails.root.join('app', 'constants', 'responses', "#{filename}.yml"), 'r')
    )
  end

  def self.tags(filename)
    YAML.safe_load(
      File.open(Rails.root.join('app', 'constants', 'tags', "#{filename}.yml"), 'r')
    )
  end
end
