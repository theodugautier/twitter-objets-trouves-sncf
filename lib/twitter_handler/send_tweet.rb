# frozen_string_literal: true

module TwitterHandler
  class SendTweet < Base
    attr_reader :tweet, :lat, :long

    def initialize(tweet:, lat:, long:)
      @tweet = tweet
      @lat = lat
      @long = long
    end

    def call
      p "#{tweet}, #{lat}, #{long}"
      # client.update("I'm tweeting with @gem!", lat: 37.7821120598956, long: -122.400612831116, display_coordinates: true)
    end
  end
end
