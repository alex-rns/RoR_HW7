class CommentsController < ApplicationController

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.update(comments_params)
    respond_to do |format|
      format.html { redirect_to @post, notice: "Comment was published." }
      format.json { head :no_content }
    end
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
    respond_to do |format|
      format.html { redirect_to @post, notice: "Comment was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:author_id, :body, :status)
  end
end
