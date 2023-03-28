require 'sidekiq-scheduler'

class TwitterBotJob
  include Sidekiq::Job
  sidekiq_options retry: false

  def perform
    TweetsParsingService.call
  rescue StandardError => e
    Rails.logger.error e.message
  end
end
