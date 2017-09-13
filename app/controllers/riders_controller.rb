class RidersController < ApplicationController
  def index
    @riders = Rider.search(params[:term])
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

  def edit
    @rider = Rider.find(params[:id])
  end

  def destroy
    @rider = Rider.find(params[:id])
    if @rider.destroy
      flash[:notice] = 'Rider deleted'
      redirect_back(fallback_location: riders_path)
    end
  end

  def update
    @rider = Rider.find(params[:id])
    if @rider.update rider_params
      flash[:notice] = 'Rider updated'
      redirect_back(fallback_location: edit_rider_path)
    end
  end

  private

  def rider_params
    params.require(:rider).permit(:name, :ytlink, :vimeolink, :term)
  end
end
