class ArticlesController < ApplicationController
  def index
    render json: Article.all, status: :ok
  end

  def show
    render json: {}    
  end  
end