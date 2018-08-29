class StationsPresenter
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def stations
    @stations = nrel_response.map do |station|
      FuelStation.new(station)
    end
  end

  private

  def nrel_response
    NrelZipSearch.find_stations(@zip_code)
  end
end