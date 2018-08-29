class SearchController < ApplicationController
  def index
    zip_code = params[:q]
    api_key = ENV['enrel_api_key']
    conn = Faraday.new(:url => "https://developer.nrel.gov/api/alt-fuel-stations/v1/") do |faraday|
            faraday.adapter  Faraday.default_adapter
          end
    json_response = conn.get "nearest.json?fuel_type=LPG,ELEC&location=#{zip_code}&radius=6.0&limit=10&api_key=#{api_key}&format=JSON"
    response = JSON.parse(json_response.body, symbolize_names: true)

    @stations = response[:fuel_stations].map do |station|
                  FuelStation.new(station)
                end

  end
end