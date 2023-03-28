require 'twitter'
class TweetsParsingService
  NAME = ENV['BOT_NAME']
  COMMAND = ENV.fetch('BOT_COMMAND', 'what is the time')

  def self.call
    new.process_tweets
  end

  def process_tweets
    tweets = $last_tweet ? TWITTER_CLIENT.mentions_timeline(since_id: $last_tweet) : TWITTER_CLIENT.mentions_timeline
    tweets.each do |tweet|
      process_tweet(tweet) unless replied?(tweet)
    end
    $last_tweet = tweets.last.id if tweets.present?
  end

  private

  def process_tweet(tweet_object)
    return unless valid_tweet?(tweet_object)

    tweet_text = tweet_object.text
    tweet_reply_text = format_response(tweet_object.user.screen_name)
    reply(tweet_reply_text, tweet_object.id)
  end

  def validate_tweet_syntax(tweet_text)
    tweet_text.downcase.include?(COMMAND)
  end

  # check if the tweet has the valid command which triggers our bot i.e., '@bot what is the time'
  def valid_tweet?(tweet_object)
    tweet_object.is_a?(Twitter::Tweet) && validate_tweet_syntax(tweet_object.text)
  end

  def format_response(tweet_sender)
    "@#{tweet_sender} The time is #{Time.current}"
  end

  def reply(text, id)
    TWITTER_CLIENT.update(text, in_reply_to_status_id: id)
  end

  def replied?(tweet)
    TWITTER_CLIENT.search("to:#{tweet.user.screen_name}", sinceId: tweet.id, result_type: 'recent').to_h.dig(:statuses).each do |reply|
      if reply.dig(:in_reply_to_status_id).eql?(tweet.id) && reply.dig(:user, :screen_name).casecmp?(NAME)
        return true
      end
    end
    false
  end
end
