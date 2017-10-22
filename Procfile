clock: bundle exec clockwork clock.rb
web: bundle exec puma
worker: bundle exec sidekiq -c ${MAX_WORKER_THREADS:-8}
