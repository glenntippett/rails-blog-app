class PagesController < ApplicationController
  def index
    @posts = Post.all
  end

  def search
    if params[:query].present?
      @posts = Post.where("title ILIKE ?", "%#{params[:query]}%")
      @posts = ['No search results found'] if @posts.size.zero?
    else
      @posts = ['No search query']
    end
  end
end
