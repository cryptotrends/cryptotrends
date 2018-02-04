# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Crypto.create!(symbol: "TRX", github_id: "115411826", subreddit_url: "https://github.com/tronprotocol/java-tron")
Crypto.create!(symbol: "MIOTA", github_id: "113606657", subreddit_url: "https://github.com/iotaledger/iri")
Crypto.create!(symbol: "XRP", github_id: "2724167", subreddit_url: "https://github.com/ripple/rippled")
Crypto.create!(symbol: "BTC", github_id: "1181927", subreddit_url: "https://github.com/bitcoin/bitcoin")
Crypto.create!(symbol: "ETH", github_id: "77478378", subreddit_url: "https://github.com/ethereum/go-ethereum")
Crypto.create!(symbol: "BCH", github_id: "89913655", subreddit_url: "https://github.com/Bitcoin-ABC/bitcoin-abc")
Crypto.create!(symbol: "LTC", github_id: "29544163", subreddit_url: "https://github.com/litecoin-project/litecoin")

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
