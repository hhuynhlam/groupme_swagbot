# frozen_string_literal: true
module NBAClient
  cattr_accessor :adapter

  def self.get(path, params = {})
    raise AdapterNotDefinedError, 'NBA' if adapter.nil?

    adapter.get(
      path,
      params,
      accept: 'application/json'
    )
  end
end
