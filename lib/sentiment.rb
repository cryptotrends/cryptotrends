module Sentiment
  extend self

  def get_sentiment(text)
    language = Google::Cloud::Language.new
    response = language.analyze_sentiment content: text, type: :PLAIN_TEXT

    sentiment = response.document_sentiment
    sentiment.score
  end

end
