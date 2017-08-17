class Api::V1::NewsController < ApiController
  def index
    if params[:tag]
      @news = News.all.order(created_at: :desc).tagged_with(params[:tag]).order(created_at: :desc)
    else
      @news = News.all.order(created_at: :desc)
    end
  end

  def show
    begin
      @news = News.find(params[:id])
    rescue => error
      render json: { message: error}, status: 404
    end
  end
end
