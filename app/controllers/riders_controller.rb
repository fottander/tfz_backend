class RidersController < ApplicationController
  def index
    @rider = Rider.all
  end

  def new
    @rider = Rider.new
  end

  def create
    @rider = Rider.new rider_params
    if @rider.save
      flash[:notice] = 'New rider added'
      redirect_back(fallback_location: new_rider_path)
    end
  end

  private

  def rider_params
    params.require(:rider).permit(:name, :ytlink, :vimeolink)
  end
end
