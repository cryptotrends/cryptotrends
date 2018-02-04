class TwitterDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # binding.pry
  end
end
