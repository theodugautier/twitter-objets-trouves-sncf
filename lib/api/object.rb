# frozen_string_literal: true

module Api
  class Object < Base
    BASE_URI = 'https://ressources.data.sncf.com/api/records/1.0/search/?dataset=objets-trouves-restitution&'

    def call
      # rubocop:disable Layout/LineLength
      response = HTTParty.get("#{BASE_URI}&rows=300&q=&lang=fr&sort=date&facet=date&facet=gc_obo_date_heure_restitution_c&facet=gc_obo_gare_origine_r_name&facet=gc_obo_nature_c&facet=gc_obo_type_c&facet=gc_obo_nom_recordtype_sc_c")
      # rubocop:enable Layout/LineLength
      return [] unless response.code == 200

      result = JSON.parse(response.body)
      result['records']
    end
  end
end
