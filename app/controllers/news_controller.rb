class NewsController < ApplicationController
  def index
    @news = News.all.order(created_at: :desc)
  end

  def show
    @news = News.find(params[:id])
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new news_params
    if @news.save
      flash[:notice] = 'News article created!'
      redirect_back(fallback_location: new_news_path)
    end
  end

  def destroy
    @news = News.find(params[:id])
    if @news.destroy
      flash[:notice] = 'News post deleted'
      redirect_back(fallback_location: news_path)
    end
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    if @news.update news_params
      flash[:notice] = 'News post updated'
      redirect_back(fallback_location: news_path)
    end
  end

  private

  def news_params
    params.require(:news).permit(:title, :content, :file)
  end
end
