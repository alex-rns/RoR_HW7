class CommentsController < ApplicationController

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.update(comments_params)
    redirect_to @post, notice: "Comment was published."
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comments_params)
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to @post, notice: "Comment was successfully deleted."
  end

  private

  def comments_params
    params.require(:comment).permit(:author_id, :body, :status)
  end
end
