class ArticlesController < ApplicationController
  include Pagination
  def index
    articles = Article.recent
    paginated = paginable(articles)
    render_collection(paginated)
  end

  def show
    render json: {}    
  end

  private

  def serializer
    ArticleSerializer
  end
end