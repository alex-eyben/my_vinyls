class VinylsController < ApplicationController
  def index
    @vinyls = Vinyl.all
  end

  def show
    @vinyl = Vinyl.find(params[:id])
    @booking = Booking.new
  end

  def new
    @vinyl = Vinyl.new
  end

  def create
    @vinyl = Vinyl.new(vinyl_params)
    @vinyl.user = current_user
    if @vinyl.save
      redirect_to dashboard_path
    else
      render :new
    end
  end


  def edit
    @vinyl = Vinyl.find(params[:id])
  end
  
  def update
    @vinyl = Vinyl.find(params[:id])
    @vinyl.update(vinyl_params)
    redirect_to dashboard_path
  end

  private
  
  def vinyl_params
    params.require(:vinyl).permit(:title, :artist, :release_date, :address, :photo)
  end
end
