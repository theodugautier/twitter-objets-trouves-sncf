# frozen_string_literal: true

require 'mongo'

module MongoHandler
  class Connect
    attr_reader :client

    def initialize
      @client = Mongo::Client.new(['localhost:27017'], database: 'objects')
    end

    def objects
      client[:objects]
    end
  end
end
