# frozen_string_literal: true
class HealthController < ApplicationController
  def show
    render plain: 'OK', status: :ok
  end
end
