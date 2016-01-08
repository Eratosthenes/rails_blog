class ArticlesController < ApplicationController
  def new
  end

  def create
    #render plain: params[:article].inspect
    @article = Article.new(params.require(:article).permit(:title, :text))
    if @article.save
      redirect_to @article
    else
      flash[:error] = "Title must be at least 5 characters"
      render 'new' 
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end
end
