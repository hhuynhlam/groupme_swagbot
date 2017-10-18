# frozen_string_literal: true
module GroupMeClient
  cattr_accessor :adapter

  def self.post(path, body)
    raise AdapterNotDefinedError, 'group_me' if adapter.nil?

    adapter.post(
      path,
      body.to_json,
      content_type: 'application/json'
    )
  end
end
