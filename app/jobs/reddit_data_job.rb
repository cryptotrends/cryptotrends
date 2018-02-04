require "net/http"
require_relative '../../lib/sentiment.rb'
class RedditDataJob < ApplicationJob
  include Sentiment
  queue_as :default

  def perform(subreddit, symbol)
    uri = URI('https://api.reddit.com/r/' + subreddit.strip.downcase + '/new?limit=20')
    n = Net::HTTP.get(uri)
    if n.length >= 46 ## Sometimes we get rate limit error
      posts_array = JSON.parse(n)["data"]["children"]
      average_sentiment = 0
      counter = 0
      total_sentiment = 0
      posts_array.each do |post|
        post_title = post["data"]["title"]
        sentiment = Sentiment.get_sentiment(post_title)
        total_sentiment += sentiment
        counter +=1
      end
      average_sentiment = total_sentiment / counter
      Crypto.find_by(symbol: symbol)
        .update_attributes(reddit_sentiment: average_sentiment)
    end
  end
end
