class Api::V1::RidersController < ApiController
  def index
    @riders = Rider.all.order(name: :asc)
  end

  def show
    begin
      @rider = Rider.find(params[:id])
    rescue => error
      render json: { message: error}, status: 404
    end
  end
end
