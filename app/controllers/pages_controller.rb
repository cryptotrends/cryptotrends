class PagesController < ApplicationController
  def home
    @cryptos = Crypto.all
  end

  def show
    @crypto = Crypto.find_by(symbol: params[:symbol])
  end
end
