class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :edit, :update, :destroy]
  before_action :set_comment, only: [:update, :destroy, :edit]

  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.build(comments_params)
    @comment.author_id = current_author.id
    @comment.save
    redirect_to @post
  end

  def edit
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
