# frozen_string_literal: true

class BotController < ApplicationController
  def listen
    bot_command = LanguageParserService.call(params[:text], context: context)

    ResponseFactory.build(bot_command) if bot_command

    head :no_content
  end

  private

  def context
    return :big_baller if request.path == '/big_baller_bot'
    return :swag if request.path == '/swag_bot'
  end
end
