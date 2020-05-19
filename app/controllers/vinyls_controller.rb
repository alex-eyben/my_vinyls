class VinylsController < ApplicationController
  def index
    @vinyls = Vinyls.all
  end

end
