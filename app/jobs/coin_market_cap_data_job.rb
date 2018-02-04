require "net/http"
class CoinMarketCapDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    uri = URI('https://api.coinmarketcap.com/v1/ticker/')
    n = Net::HTTP.get(uri)
    coins_array = JSON.parse(n)

    coins_array.each do |coin|
      c = Crypto.find_by(symbol: coin["symbol"])
      unless c.present?
        Crypto.create!(
          name: coin["name"].downcase,
          symbol: coin["symbol"],
          price: coin["price_usd"],
          volume_24h: coin["24h_volume_usd"],
          circulating_supply: coin["total_supply"],
          market_cap: coin["market_cap_usd"], 
          change_24h: coin["percent_change_24h"],
          change_1h: coin["percent_change_1h"]
        )
      else
        c.update_attributes(
          name: coin["name"].downcase,
          symbol: coin["symbol"],
          price: coin["price_usd"],
          volume_24h: coin["24h_volume_usd"],
          market_cap: coin["market_cap_usd"], 
          circulating_supply: coin["total_supply"],
          change_24h: coin["percent_change_24h"],
          change_1h: coin["percent_change_1h"]
        )
      end
    end
  end
end
