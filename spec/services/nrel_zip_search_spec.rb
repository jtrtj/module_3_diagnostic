require 'rails'

describe NrelZipSearch do
  it 'can return a parsed response of 10 stations info from the ENREL API', :vcr do
    visitor_zip = 80203
    response = NrelZipSearch.find_stations(visitor_zip)

    expect(response.count).to eq(10)
    expect(response.first).to have_key(:station_name)
    expect(response.first).to have_key(:distance)
    expect(response.first).to have_key(:fuel_type_code)
  end
end