class NrelZipSearch
  def self.find_stations(zip_code)
    response(zip_code)[:fuel_stations]
  end

  private
  def self.response(zip_code)
    JSON.parse(search_nearest_by_zip(zip_code).body, symbolize_names: true)
  end

  def self.search_nearest_by_zip(zip_code)
    nrel_conn.get "nearest.json?fuel_type=LPG,ELEC&location=#{zip_code}&radius=6.0&limit=10&api_key=#{ENV['enrel_api_key']}&format=JSON"
  end

  def self.nrel_conn
    conn = Faraday.new(:url => "https://developer.nrel.gov/api/alt-fuel-stations/v1/") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end
end