class BookingsController < ApplicationController
  # def new
  #   @vinyl = Vinyl.find(params[:vinyl_id])
  #   @booking = Booking.new
  # end

  def create
    @booking = Booking.new(booking_params)
    @vinyl = Vinyl.find(params[:vinyl_id])
    @booking.vinyl = @vinyl
    @booking.user = current_user
    if @booking.save
      flash[:notice] = "Your booking is registered"
      redirect_to dashboard_path(@user)
    else
      render "vinyls/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date_begin, :date_end)
  end
end
