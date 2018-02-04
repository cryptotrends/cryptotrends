require "net/http"
class GithubJob < ApplicationJob
  queue_as :default

  def perform
    Crypto.all.each do |crypto|
      if !crypto[:github_id].nil?
        binding.pry
        get_github_for(crypto[:github_id], crypto[:symbol])
      end
    end
  end

  def get_github_for(link, symbol)
    commit_array = OctoClient.commits(link)
    x = 0
    y = 0
    commit_array.each do |commit|
      sha = commit["sha"]
      stats = OctoClient.commit(link, sha)["stats"]
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
