class Api::V1::RidersController < ApiController
  def index
    @rider = Rider.all.order(created_at: :desc)
  end

  def show
    begin
      @rider = Rider.find(params[:id])
    rescue => error
      render json: { message: error}, status: 404
    end
  end
end
