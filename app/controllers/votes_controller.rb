class VotesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    @comment.votes.create(author: current_author)
    redirect_to @post
  end

  def destroy
  end

  private

  def votes_params
    params.require(:vote).permit(:author)
  end
end
