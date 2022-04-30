class CommentsController < ApplicationController
  before_action :find_comment, only: %i[edit update]

  # def index
  #   @comments = policy_scope(Comment)
  # end

  def edit
    @post = Post.find(params[:post_id])
    authorize @comment
  end

  def update
    @comment.update(comment_params)
    @post = Post.find(params[:post_id])
    redirect_to post_path(@post)
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
