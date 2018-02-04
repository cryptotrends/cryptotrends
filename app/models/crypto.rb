class Crypto < ApplicationRecord
  def calculate_total_index
    i = 0
    x = 0
    if !github_index.nil?
      i += 1
      x += github_index
    end
    if !tweets_sentiment.nil?
      i += 1
      x += tweets_sentiment
    end
    if !reddit_sentiment.nil?
      i += 1
      x += reddit_sentiment
    end
    i = 1 if i == 0
    x / i
  end

  def self.set_total_index
    Crypto.all.each do |crypto|
      crypto.update_attributes(:total_index, crypto.total_index)
    end
  end
end
