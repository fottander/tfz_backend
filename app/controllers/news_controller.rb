class NewsController < ApplicationController
  def index
    @news = News.all
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

  private

  def news_params
    params.require(:news).permit(:title, :content, :file)
  end
end
