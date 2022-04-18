class ArticlesController < ApplicationController
  include Pagination
  def index
    articles = Article.recent
    paginated = paginable(articles)
    render_collection(paginated)
  end

  def show
    article = Article.find_by(id: params[:id])
    render json: serializer.new(article), status: :ok   
  end

  private

  def serializer
    ArticleSerializer
  end
end