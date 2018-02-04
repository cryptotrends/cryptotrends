require "./lib/sentiment"

class TwitterDataJob < ApplicationJob
  include Sentiment
  queue_as :default

  def perform
    Crypto.all.each do |crypto|
      search_for(crypto[:name])
    end
  end

  def search_for(coin)
    statuses = TwitterClient.search(coin).attrs[:statuses]
    avg = 0
    statuses.each do |status|
      avg += get_sentiment(status[:text])
    end
    avg /= statuses.size

    u.update_attributes(tweets_24h: statuses.size, tweets_sentiment: avg)
  end
end
