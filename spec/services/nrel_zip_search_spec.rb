require 'rails'

describe NrelZipSearch do
  it 'can return a parsed response of 10 stations info from the ENREL API' do
    visitor_zip = 80203

    expect(NrelZipSearch.find_stations(visitor_zip)).to have_key(:station_name)
    expect(NrelZipSearch.find_stations(visitor_zip)).to have_key(:distance)
    expect(NrelZipSearch.find_stations(visitor_zip)).to have_key(:fuel_type_code)
  end
end