class VinylsController < ApplicationController
  def index
    if params[:query].present?
      @vinyls = Vinyl.search_by_title_and_artist(params[:query])
    else
      @vinyls = Vinyl.all
    end
  end

  def show
    @vinyl = Vinyl.find(params[:id])
    @booking = Booking.new
    @markers = [{
      lat: @vinyl.latitude,
      lng: @vinyl.longitude
    }]
  end
end
