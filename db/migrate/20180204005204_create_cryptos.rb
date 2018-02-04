class CreateCryptos < ActiveRecord::Migration[5.1]
  def change
    create_table :cryptos do |t|
      t.string :name
      t.string :symbol
      t.decimal :price
      t.bigint :market_cap
      t.bigint :volume_24h
      t.bigint :circulating_supply
      t.decimal :change_24h
      t.decimal :change_1h
      t.integer :tweets_24h
      t.decimal :tweets_sentiment
      t.integer :reddit_posts_24h

      t.timestamps
    end
  end
end
