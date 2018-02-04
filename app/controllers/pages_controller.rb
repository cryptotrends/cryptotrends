class PagesController < ApplicationController
  def home
    @cryptos = Crypto.all
  end
end
