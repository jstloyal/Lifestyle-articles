class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created!"
      redirect_to article_path(@article)
    else
      flash[:alert] = "An error occured"
      render 'new'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image )
  end
end
