class StationsPresenter
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def stations
    @stations = nrel_response[:fuel_stations].map do |station|
      FuelStation.new(station)
    end
  end

  private
  def nrel_conn
    conn = Faraday.new(:url => "https://developer.nrel.gov/api/alt-fuel-stations/v1/") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def nrel_response
    NrelZipSearch.find_stations(@zip_code)
    # json_response = nrel_conn.get "nearest.json?fuel_type=LPG,ELEC&location=#{@zip_code}&radius=6.0&limit=10&api_key=#{ENV['enrel_api_key']}&format=JSON"
    # response = JSON.parse(json_response.body, symbolize_names: true)
  end
end