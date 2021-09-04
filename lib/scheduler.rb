# frozen_string_literal: true


require 'sqlite3'
require 'rufus/scheduler'

# require_relative 'mongo_handler/connect'
require_relative 'sncf/station'
require_relative 'sncf/object'
require_relative 'api/base'
require_relative 'api/object'
require_relative 'api/station'
require_relative 'twitter_handler/base'
require_relative 'twitter_handler/send_tweet'

scheduler = Rufus::Scheduler.new

scheduler.every '2h' do
  objects = Api::Object.new.call
  db = SQLite3::Database.new 'objects.db'
  # db = MongoHandler::Connect.new.objects
  
  objects.each do |object|
    instance = Sncf::Object.new(object: object)
    next unless db.execute( "select * from objects WHERE objects.recordid = ?", instance.record_id).count.zero?

    result = db.execute("INSERT INTO objects (recordid) VALUES (?)", [instance.record_id])

    tweet = "Un nouvel objet perdu dans un train vient d\'être ramené à un guichet SNCF !"\
            "\nType : #{instance.type} \n"\
            "Trouvé à #{instance.train_station_name} le #{instance.hour} \n"\
            '#ObjetsTrouvésSncf #' + instance.city.gsub('-', '')
    
    TwitterHandler::SendTweet.new(tweet: tweet, lat: instance.station.lat,
                                  long: instance.station.long).call
  end
end

scheduler.join
