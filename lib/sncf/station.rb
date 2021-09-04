# frozen_string_literal: true

require 'httparty'

module Sncf
  class Station
    attr_reader :station

    def initialize(station:)
      @station = station
    end

    def city
      station['fields']['commune_libellemin']
    end

    def lat
      station['geometry']['coordinates'][0]
    end

    def long
      station['geometry']['coordinates'][1]
    end
  end
end