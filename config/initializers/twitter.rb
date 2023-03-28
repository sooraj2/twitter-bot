TWITTER_CLIENT = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['TWITTER_BOT_API_KEY']
  config.consumer_secret     = ENV['TWITTER_BOT_API_SECRET']
  config.access_token        = ENV['TWITTER_BOT_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_BOT_ACCESS_TOKEN_SECRET']
end

$last_tweet = nil
