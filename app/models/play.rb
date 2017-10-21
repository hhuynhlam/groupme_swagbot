# frozen_string_literal: true

class Play < ApplicationRecord
  include Mongoid::Document
  SHOT_MADE_RESPONSES = ConstantService.responses(:shot_made)
  THREE_POINT_SHOT_MADE_RESPONSES = ConstantService.responses(:three_point_shot_made)

  BIG_BALLER_SHOT_MADE = /.*(Ball).*(Shot:).*(Made)/i
  SWAG_SHOT_MADE = /.*(Young).*(Shot:).*(Made)/i
  THREE_POINT_SHOT_MADE = /.*(3pt).*(Shot:)/i

  belongs_to :game

  field :description, type: String
  field :event_id, type: String

  def bot
    return :big_baller if big_baller?
    return :swag if swag?
  end

  def group_me_message
    return unless bot
    return THREE_POINT_SHOT_MADE_RESPONSES.sample if three_pointer?

    SHOT_MADE_RESPONSES.sample
  end

  private

  def big_baller?
    description.match(BIG_BALLER_SHOT_MADE).present?
  end

  def swag?
    description.match(SWAG_SHOT_MADE).present?
  end

  def three_pointer?
    description.match(THREE_POINT_SHOT_MADE).present?
  end
end
