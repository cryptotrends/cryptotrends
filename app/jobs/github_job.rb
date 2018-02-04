require "net/http"
class GithubJob < ApplicationJob
  queue_as :default

  def perform
    Crypto.all.each do |crypto|
      if !crypto[:github_id].nil?
        get_github_for('https://api.github.com/repositories/' + crypto[:github_id] + '/commits', crypto[:symbol])
    end
  end

  def get_github_for(link, symbol)
    uri = URI(link)
    n = Net::HTTP.get(uri)
    commit_array = JSON.parse(n)
    binding.pry

    x = 0
    y = 0
    commit_array.each do |commit|
      sha = commit["sha"]
      commit_uri = URI(link + '/' + sha)
      commit_json = Net::HTTP.get(commit_uri)
      stats = JSON.parse(commit_json)["stats"]
      if stats.nil?
        y += 1
        next
      end
      temp = stats["deletions"] - stats["additions"]
      x += get_index(temp)
    end
    binding.pry
    x /= (commit_array.size - y)
    binding.pry
    u = Crypto.find_by(symbol: symbol)
    if !u
      u = Crypto.create!(symbol: symbol)
    end
    binding.pry
    u.update_attributes(github_index: x)
  end

  def get_index(temp)
    x = 0
    if temp < 5 && temp > -5
      x += -0.5
      if temp == 0
        x += -1.0
      end
    else
      x += 1.0
    end
    return x
  end
end


    # #tron = 115411826
    # get_github_for('https://api.github.com/repositories/115411826/commits', "TRX")
    #
    # #iota = 113606657
    # get_github_for('https://api.github.com/repositories/113606657/commits', "MIOTA")
    #
    # #ripple = 2724167
    # get_github_for('https://api.github.com/repositories/2724167/commits', "XRP")
    #
    # #bitcoin = 1181927
    # get_github_for('https://api.github.com/repositories/1181927/commits', "BTC")
    #
    # #ethereum = 77478378
    # get_github_for('https://api.github.com/repositories/77478378/commits', "ETH")
    #
    # #bitcoin-abc (cash) = 89913655
    # get_github_for('https://api.github.com/repositories/89913655/commits', "BCH")
    #
    # #litecoin = 29544163
    # get_github_for('https://api.github.com/repositories/29544163/commits', "LTC")
