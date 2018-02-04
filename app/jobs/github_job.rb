require "net/http"
class GithubJob < ApplicationJob
  queue_as :default

  def perform
    Crypto.all.each do |crypto|
      if !crypto.github_id.nil?
        get_github_for(crypto)
      end
    end
  end

  def get_github_for(crypto)
    commit_array = OctoClient.commits(crypto.github_id)
    x = 0
    y = 0
    commit_array.each do |commit|
      sha = commit["sha"]
      stats = OctoClient.commit(crypto.github_id, sha)["stats"]
      if stats.nil?
        y += 1
        next
      end
      temp = stats["deletions"] - stats["additions"]
      x += get_index(temp)
    end
    x /= (commit_array.size - y)
    crypto.update_attributes(github_index: x)
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
