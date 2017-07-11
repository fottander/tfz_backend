class Api::V1::NewsController < ApiController
  def index
    @news = News.all.order(created_at: :desc)
  end

  def show
    begin
      @news = News.find(params[:id])
    rescue => error
      render json: { message: error}, status: 404
    end
  end
end
