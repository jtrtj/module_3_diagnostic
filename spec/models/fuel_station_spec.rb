require 'rails_helper'

describe FuelStation do
  it 'can create attributes from API json' do
    mock_station = File.read('fixtures/mock_station.json')
    attributes = JSON.parse(mock_station, symbolize_names: true)
    
    station = FuelStation.new(attributes)

    expect(station.name).to eq(attributes[:station_name])
    expect(station.address).to eq(attributes[:street_address])
    expect(station.fuel_types).to eq(attributes[:fuel_type_code])
    expect(station.distance).to eq(attributes[:distance])
    expect(station.access_times).to eq(attributes[:access_days_time])
  end
end