# frozen_string_literal: true

RSpec.describe Sncf::Object do
  subject { Sncf::Object.new(object: Api::Object.new.call[0]) }

  before(:each) do
    json_object = [{ 'datasetid' => 'objets-trouves-restitution', 'recordid' => '04b3df9a87c8bed701ca5259df8650d41b519c98',
                     'fields' => { 'gc_obo_nature_c' => 'Téléphone portable protégé (étui, coque,…)', 'gc_obo_gare_origine_r_name' => 'Strasbourg', 'gc_obo_gare_origine_r_code_uic_c' => '0087212027', 'gc_obo_nom_recordtype_sc_c' => 'Objet trouvé', 'gc_obo_type_c' => 'Appareils électroniques, informatiques, appareils photo', 'date' => '2021-09-04T08:51:26+00:00' }, 'record_timestamp' => '2021-09-04T09:01:09.585000+00:00' }]
    json_station = { 'datasetid' => 'referentiel-gares-voyageurs', 'recordid' => '41ac248dc7dc71bcf320ae6742e313cba84547b5',
                     'fields' => { 'uic_code' => '0087271494', 'departement_numero' => '95', 'departement_libellemin' => "Val-d'Oise", 'gare' => '{"DRG_ON": true, "Etrangere_ON": false, "NbPltf": 2, "Alias_Libelle_NonContraint": "Aéroport Charles de Gaulle 2 TGV", "Alias_Libelle_Fronton": "Aéroport Charles de Gaulle 2 TGV", "AgenceGC_Libelle": "DTG Parisiennes Nord", "RegionSNCF_Libelle": "REGION DE PARIS-NORD", "UG_Libelle": "UG Paris Gare du Nord et CDG2", "UT_Libelle": "AEROPORT CHARLES DE GAULLE 2 TGV P GARE"}', 'gare_ut_libelle' => 'AEROPORT CHARLES DE GAULLE 2 TGV P GARE', 'tvs' => 'RYT', 'tvss' => '[{"TVS_Code": "RYT"}]', 'code' => '02541-1', 'gare_alias_libelle_noncontraint' => 'Aéroport Charles de Gaulle 2 TGV', 'longitude_entreeprincipale_wgs84' => '2.570892', 'wgs_84' => [49.003652, 2.570892], 'segmentdrg_libelle' => 'a', 'gare_etrangere_on' => 'False', 'niveauservice_libelle' => 3, 'commune_code' => '527', 'gare_drg_on' => 'True', 'gare_agencegc_libelle' => 'DTG Parisiennes Nord', 'gare_regionsncf_libelle' => 'REGION DE PARIS-NORD', 'commune_libellemin' => 'Roissy-en-France', 'gare_alias_libelle_fronton' => 'Aéroport Charles de Gaulle 2 TGV', 'code_gare' => '02541', 'alias_libelle_noncontraint' => 'Aéroport Charles de Gaulle 2 TGV', 'adresse_cp' => '95700', 'gare_ug_libelle' => 'UG Paris Gare du Nord et CDG2', 'latitude_entreeprincipale_wgs84' => '49.003652', 'rg_libelle' => 'GARE AEROPORT CDG 2 TGV', 'gare_nbpltf' => 2 }, 'geometry' => { 'type' => 'Point', 'coordinates' => [2.570892, 49.003652] }, 'record_timestamp' => '2021-09-03T22:00:01.027000+00:00' }
    allow_any_instance_of(Api::Station).to receive('call').and_return(json_station)
    allow_any_instance_of(Api::Object).to receive('call').and_return(json_object)
  end

  describe '#type' do
    it 'returns type of object' do
      expect(subject.type).to eq('Téléphone portable protégé (étui, coque,…)')
    end
  end

  describe '#train_station_name' do
    it 'returns station name of object' do
      expect(subject.train_station_name).to eq('Strasbourg')
    end
  end

  describe '#record_id' do
    it 'returns record_id' do
      expect(subject.record_id).to eq('04b3df9a87c8bed701ca5259df8650d41b519c98')
    end
  end

  describe '#city' do
    it 'returns record_id' do
      expect(subject.city).to eq('Roissy-en-France')
    end
  end

  describe '#hour' do
    it 'returns record_id' do
      expect(subject.hour).to eq('04/09/2021 08:51:26')
    end
  end

  describe '#station' do
    it 'returns record_id' do
      expect(subject.station).to be_an_instance_of(Sncf::Station)
    end
  end
end
