Sidekiq.configure_server do |config|
    config.redis = { url: ENV['REDIS_URL'] || 'redis://redis:6379/1' }
  end
  
  Sidekiq.configure_client do |config|
    config.redis = { url: ENV['REDIS_URL'] || 'redis://redis:6379/1' }
  end
  
Sidekiq::Cron::Job.create(
  name: 'Update counts - every hour',
  cron: '0 * * * *',
  class: 'UpdateCountsJob'
)