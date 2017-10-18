# frozen_string_literal: true
Rails.application.routes.draw do
  get '/big_baller_bot', to: 'health#show'
  post '/big_baller_bot', to: 'health#show'

  get '/swag_bot', to: 'health#show'
  post '/swag_bot', to: 'health#show'
end
