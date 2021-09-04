# frozen_string_literal: true

module Api
  class Station < Base
  
    attr_reader :code

    BASE_URI= 'https://ressources.data.sncf.com/api/records/1.0/search/?dataset=referentiel-gares-voyageurs&'

    def initialize(code:)
      @code = code
    end

    def call
      JSON.parse(get_train_station)['records'][0]
    end

    private

    def get_train_station
      response = HTTParty.get("#{BASE_URI}q=#{code}&sort=gare_alias_libelle_noncontraint&facet=gare_agencegc_libelle&facet=gare_regionsncf_libelle&facet=gare_ug_libelle&facet=pltf_departement_libellemin&facet=pltf_segmentdrg_libelle")
      return {} unless response.code == 200

      response.body
    end
  end
end