# frozen_string_literal: true
class AdapterNotDefinedError < StandardError
  def initialize(external_service)
    super("You must set an Adapter to connect to #{external_service&.titleize}")
  end
end
