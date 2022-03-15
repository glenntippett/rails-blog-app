class PagesController < ApplicationController
  def index
    @posts = Post.all
  end

  def search
    if params[:query].present?
      # @posts = Post.where(title: params[:query])
      @posts = Post.where("title ILIKE ?", "%#{params[:query]}%")
    else
      # @posts = Movie.all
      @posts = Post.all
    end
  end
end
