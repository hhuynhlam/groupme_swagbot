# frozen_string_literal: true

class LanguageParserService
  BIG_BALLER = ConstantService.tags(:big_baller)
  SWAG = ConstantService.tags(:swag)
  PLAYING = ConstantService.tags(:playing)
  WAKE = ConstantService.tags(:wake)

  def self.call(message = '', options)
    new(message, options).call
  end

  def initialize(message, context:)
    @context = context
    @message = message.downcase.split
  end

  def call
    return { command: :playing, bot: @context } if playing?
    return { command: :wake, bot: @context } if wake?
  end

  private

  def playing?
    playing_big_baller? || playing_swag?
  end

  def playing_big_baller?
    (PLAYING & @message).any? && (BIG_BALLER & @message).any? && @context == :big_baller
  end

  def playing_swag?
    (PLAYING & @message).any? && (SWAG & @message).any? && @context == :swag
  end

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
