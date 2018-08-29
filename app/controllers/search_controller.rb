class SearchController < ApplicationController
  def index
    @stations_presenter = StationsPresenter.new(params[:q])
  end
end