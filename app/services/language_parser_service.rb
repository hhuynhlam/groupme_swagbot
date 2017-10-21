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
    { command: :wake, bot: @context } if wake?
  end

  private

  def wake?
    waking_big_baller? || waking_swag?
  end

  def waking_big_baller?
    (WAKE & @message).any? && (BIG_BALLER & @message).any? && @context == :big_baller
  end

  def waking_swag?
    (WAKE & @message).any? && (SWAG & @message).any? && @context == :swag
  end
end
