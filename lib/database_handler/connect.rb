# frozen_string_literal: true

require 'sqlite3'
require 'dotenv/load'

module DatabaseHandler
  class Connect
    attr_reader :client

    def initialize
      @client = SQLite3::Database.new(ENV['DATABASE_NAME'])
    end

    def objects
      client[:objects]
    end
  end
end
