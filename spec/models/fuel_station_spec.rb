require 'rails_helper'

describe FuelStation do
  it 'has attributes' do
    attributes = JSON.parse('/fixtures/mock_station.json')
    require 'pry'; binding.pry
  end
end