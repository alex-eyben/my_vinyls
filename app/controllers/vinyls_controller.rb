class VinylsController < ApplicationController
  def index
    @vinyls = Vinyl.all
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
