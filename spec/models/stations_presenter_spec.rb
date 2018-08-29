require 'rails_helper'

describe StationsPresenter do
  context 'instance methods' do   
    it 'can generate a list of stations from a zip code', :vcr do
      visitor_zip = 80203
      stations_presenter = StationsPresenter.new(visitor_zip)

      expect(stations_presenter.stations.count).to eq(10)
      expect(stations_presenter.stations.first.class).to be(FuelStation)
      expect(stations_presenter.stations.last.class).to be(FuelStation)
    end
  end
end
