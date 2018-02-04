# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Crypto.create!(symbol: "BTC", github_id: "1181927", github_url: "https://github.com/bitcoin/bitcoin")
Crypto.create!(symbol: "ETH", github_id: "77478378", github_url: "https://github.com/ethereum/go-ethereum")
Crypto.create!(symbol: "XRP", github_id: "2724167", github_url: "https://github.com/ripple/rippled")
Crypto.create!(symbol: "BCH", github_id: "89913655", github_url: "https://github.com/Bitcoin-ABC/bitcoin-abc")
Crypto.create!(symbol: "LTC", github_id: "29544163", github_url: "https://github.com/litecoin-project/litecoin")
Crypto.create!(symbol: "XLM", github_id: nil, github_url: "https://github.com/stellar/stellar-core")
Crypto.create!(symbol: "NEO", github_id: nil, github_url: "https://github.com/neo-project/neo")
Crypto.create!(symbol: "EOS", github_id: nil, github_url: "https://github.com/EOSIO/eos")
Crypto.create!(symbol: "NEM", github_id: nil, github_url: "https://github.com/NemProject/nem.core")
Crypto.create!(symbol: "MIOTA", github_id: "113606657", github_url: "https://github.com/iotaledger/iri")
Crypto.create!(symbol: "DASH", github_id: nil, github_url: "https://github.com/dashcoin/dashcoin")
Crypto.create!(symbol: "XMR", github_id: nil, github_url: "https://github.com/monero-project/monero")
Crypto.create!(symbol: "TRX", github_id: "115411826", github_url: "https://github.com/tronprotocol/java-tron")
Crypto.create!(symbol: "LISK", github_id: nil, github_url: "https://github.com/LiskHQ/lisk")


puts 'getting coinmarketcap data'
c = CoinMarketCapDataJob.new
c.perform

puts 'getting reddit data'
r = RedditDataJob.new
r.perform("Tronix", "TRX")
r.perform("Iota", "MIOTA")
r.perform("Ripple", "XRP")
r.perform("Bitcoin", "BTC")
r.perform("ethereum", "ETH")
r.perform("Bitcoincash", "BCH")
r.perform("litecoin", "LTC")
r.perform("cardano", "ADA")
r.perform("Stellar", "XLM")
r.perform("NEO", "NEO")
r.perform("nem", "XEM")
r.perform("eos", "EOS")
r.perform("dashpay", "DASH")
r.perform("Monero", "XMR")
r.perform("Lisk", "LSK")
r.perform("Vechain", "VEN")
r.perform("Tether", "USDT")
r.perform("EthereumClassic", "ETC")
