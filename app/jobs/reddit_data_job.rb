require "net/http"
class RedditDataJob < ApplicationJob
  queue_as :default

  def perform(subreddit)
    uri = URI('https://api.reddit.com/r/bitcoin/new?limit=100')
    n = Net::HTTP.get(uri)
    if n.length >= 46 ## Sometimes we get rate limit error 
      posts_array = JSON.parse(n)["data"]["children"]
      #binding.pry

      average_sentiment = 0
      posts_array.each do |post|
        post_title = post["data"]["title"]
        #sentiment = __
        average_sentiment += sentiment
      end
    end
  end
end
