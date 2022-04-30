class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    # TODO: Replace finding user with the current user logged in
    @user = User.find_by_email('test@test.com')
    @post.user_id = @user.id

    @post.save
    redirect_to profile_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to profile_path
  end

  def like
    @post = Post.find(params[:id])
    Like.create(user: current_user, post: @post)
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :rich_body)
  end
end
