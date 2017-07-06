class Api::V1::NewsController < ApiController
  def index
    @news = News.all
  end
end
