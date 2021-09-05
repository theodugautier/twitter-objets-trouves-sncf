# frozen_string_literal: true

module TwitterHandler
  class SendTweet < Base
    attr_reader :tweet, :lat, :long

    def initialize(tweet:, lat:, long:)
      super
      @tweet = tweet
      @lat = lat
      @long = long
    end

    def call
      client.update(tweet, lat: lat, long: long, display_coordinates: true)
    end
  end
end
