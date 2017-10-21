# frozen_string_literal: true

class Play < ApplicationRecord
  include Mongoid::Document
  SHOT_MADE = ConstantService.responses(:shot_made)

  BIG_BALLER_3PT_SHOT_MADE = /.*(Ball).*(3pt).*(Shot:).*(Made)/i
  BIG_BALLER_SHOT_MADE = /.*(Ball).*(Shot:).*(Made)/i
  SWAG_3PT_SHOT_MADE = /.*(Young).*(3pt).*(Shot:).*(Made)/i
  SWAG_SHOT_MADE = /.*(Young).*(Shot:).*(Made)/i

  belongs_to :game

  field :description, type: String
  field :event_id, type: String

  def bot
    return :big_baller if big_baller?
    return :swag if swag?
  end

  def group_me_message
    return SHOT_MADE.sample if bot
  end

  private

  def big_baller?
    description.match(BIG_BALLER_3PT_SHOT_MADE).present? ||
      description.match(BIG_BALLER_SHOT_MADE).present?
  end

  def swag?
    description.match(SWAG_3PT_SHOT_MADE).present? ||
      description.match(SWAG_SHOT_MADE).present?
  end
end
