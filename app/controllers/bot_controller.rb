# frozen_string_literal: true

class BotController < ApplicationController
  def listen
    bot_command = LanguageParserService.call(
      params[:text],
      context: request.path
    )

    ResponseFactory.build(bot_command) if bot_command

    head :no_content
  end
end
