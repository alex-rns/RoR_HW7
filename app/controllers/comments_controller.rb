class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :edit, :update, :destroy, :publish, :new]
  before_action :set_comment, only: [:update, :destroy, :edit, :publish, :destroy]
  before_action :set_cookies

  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.build(comments_params)
    @comment.author_id = current_author.id
    if @comment.ancestors.count > 5
      redirect_to @post, notice: 'Stop flooding, comments nesting exceeded'
    else
      if @comment.save
        render 'comments/create'
        # redirect_to @post, notice: "Post was successfully created."
      else
        parent_id = @comment.parent ? @comment.parent.id : nil
        redirect_to @post, flash: { comment_error: @comment.errors.full_messages.join(', '), comment_id: parent_id }
      end
    end
  end

  def edit
  end

  def update
    @comment.edited_at = Time.now
    @comment.update(comments_params)
    redirect_to @post, notice: "Comment was edited."
  end

  def publish
    @comment.update(comments_params)
    redirect_to @post, notice: "Comment was published!."
  end

  def destroy
    if @comment.destroy
      render 'destroy'
    else
      redirect_to @post
    end

    # redirect_to @post, notice: "Comment was successfully deleted."
  end

  private

  def set_cookies
    unless current_author
      cookies[:views] = cookies[:views] ? cookies[:views].to_i + 1 : 1
    end
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comments_params
    params.require(:comment).permit(:author_id, :body, :status, :parent_id)
  end
end
