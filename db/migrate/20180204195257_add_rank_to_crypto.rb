class AddRankToCrypto < ActiveRecord::Migration[5.1]
  def change
    add_column :cryptos, :rank, :integer
  end
end
