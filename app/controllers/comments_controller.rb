class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :update, :destroy]
  before_action :set_comment, only: [:update, :destroy]

  def create
    @comment = @post.comments.create(comments_params)
    redirect_to @post
  end

  def update
    @comment.update(comments_params)
    redirect_to @post, notice: "Comment was published."
  end

  def destroy
    @comment.destroy
    redirect_to @post, notice: "Comment was successfully deleted."
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comments_params
    params.require(:comment).permit(:author_id, :body, :status)
  end
end
