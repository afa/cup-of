class Admin::ArticlesController < ApplicationController
 before_filter :get_articles, :only=>[:index]
 before_filter :get_article, :only=>[:show, :edit, :update]

  def index
  end

  def show
  end

  def edit
  end

  def update
   if @article.update_attributes(params[:article])
    redirect_to admin_articles_path
   else
    render :edit
   end
  end

  def new
   @article = Article.new
  end

  def create
   if Article.create(params[:article])
    redirect_to admin_articles_path
   else
    @article = Article.new(params[:article])
    render :new
   end
  end

 protected
  def get_articles
   @articles = Article.order('created_at desc').all
  end

  def get_article
   @article = Article.find(params[:id])
  end
end
