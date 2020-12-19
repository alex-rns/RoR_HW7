class CommentsController < ApplicationController
  # def update
  #   @post = Post.find(params[:post_id])
  #   if @comment.update(params[:status])
  #     redirect_to @post
  #   end
  # end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comments_params)
    redirect_to @post
  end

  private

  def comments_params
    params.require(:comment).permit(:author_id, :body)
  end
end
