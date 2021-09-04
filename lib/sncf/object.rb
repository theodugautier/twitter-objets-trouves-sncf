# frozen_string_literal: true

module Sncf
  class Object
    attr_reader :object

    def initialize(object:)
      @object = object
    end

    def type
      object['fields']['gc_obo_nature_c']
    end

    def train_station_name
      object['fields']['gc_obo_gare_origine_r_name']
    end

    def record_id
      object['recordid']
    end

    def city
      station.city
    end

    def hour
      DateTime.parse(object['fields']['date']).strftime('%d/%m/%Y %H:%M:%S')
    end

    def station
      station = ::Api::Station.new(code: object['fields']['gc_obo_gare_origine_r_code_uic_c']).call
      ::Sncf::Station.new(station: station)
    end
  end
end