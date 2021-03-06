# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180204195257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cryptos", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.decimal "price"
    t.bigint "github_id"
    t.bigint "market_cap"
    t.bigint "volume_24h"
    t.bigint "circulating_supply"
    t.decimal "change_24h"
    t.decimal "change_1h"
    t.integer "tweets_24h"
    t.decimal "tweets_sentiment"
    t.decimal "reddit_sentiment"
    t.integer "reddit_posts_24h"
    t.string "github_url"
    t.decimal "github_index"
    t.decimal "total_index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rank"
  end

end
