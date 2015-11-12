class ArticlesController < ApplicationController
  include ArticlesHelper  

  def index
    @article = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(articles_params)
    @article.save
    redirect_to article_path(@article)
    flash.notice = "Your article '#{@article.title}' has been created"
  end

  def destroy
    @article = Article.destroy(params[:id])
    redirect_to articles_path
    flash.notice = "The article '#{@article.title}' has been deleted"
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(articles_params)

    flash.notice = "Your article '#{@article.title}' has been updated!"

    redirect_to article_path(@article)
end

end
