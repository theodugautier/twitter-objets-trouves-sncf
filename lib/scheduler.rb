# frozen_string_literal: true

require 'rufus/scheduler'

require_relative 'mongo_handler/connect'
require_relative 'sncf/station'
require_relative 'sncf/object'
require_relative 'api/base'
require_relative 'api/object'
require_relative 'api/station'
require_relative 'twitter_handler/base'
require_relative 'twitter_handler/send_tweet'

scheduler = Rufus::Scheduler.new

scheduler.in '1s' do
  objects = Api::Object.new.call
  db = MongoHandler::Connect.new.objects

  objects.each do |object|
    instance = Sncf::Object.new(object: object)
    if db.find(recordid: instance.record_id).count == 0
      result = db.insert_one( { recordid: instance.record_id } )
      tweet = "Un nouvel objet perdu dans un train vient d\'être ramené à un guichet SNCF ! \nType : #{instance.type} \nTrouvé à #{instance.train_station_name} le #{instance.hour} \n#ObjetsTrouvésSncf #" + instance.city.gsub('-', '')

      TwitterHandler::SendTweet.new(tweet: tweet, lat: instance.station.lat, long: instance.station.long).call if result.n == 1
    end
  end
end

scheduler.join