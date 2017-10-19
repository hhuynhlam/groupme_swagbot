# frozen_string_literal: true
require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web, at: 'sidekiq'

  get '/big_baller_bot', to: 'health#show'
  post '/big_baller_bot', to: 'bot#listen'

  get '/swag_bot', to: 'health#show'
  post '/swag_bot', to: 'bot#listen'
end
