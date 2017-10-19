# frozen_string_literal: true

class LanguageParserService
  BIG_BALLER = ConstantService.tags(:big_baller)
  SWAG = ConstantService.tags(:swag)
  WAKE = ConstantService.tags(:wake)

  def self.call(message = '', options)
    new(message, options).call
  end

  def initialize(message, context:)
    @context = context
    @message = message.downcase.split
  end

  def call
    return { command: :wake, bot: :big_baller } if waking_big_baller?
    return { command: :wake, bot: :swag } if waking_swag?
  end

  private

  def waking_big_baller?
    (WAKE & @message).any? && (BIG_BALLER & @message).any? && @context == '/big_baller_bot'
  end

  def waking_swag?
    (WAKE & @message).any? && (SWAG & @message).any? && @context == '/swag_bot'
  end
end
