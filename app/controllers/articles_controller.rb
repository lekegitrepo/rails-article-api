class ArticlesController < ApplicationController
  def index
    articles = Article.recent
    paginated = paginator.call(
      articles,
      params: pagination_params,
      base_url: request.url
    )
    
    # binding.pry
    
    render json: ArticleSerializer.new(articles), status: :ok
  end

  def show
    render json: {}    
  end

  private

  def serializer
    ArticleSerializer
  end

  def paginator
    JSOM::Pagination::Paginator.new
  end
  

  def pagination_params
    params.permit![:page]
  end
end