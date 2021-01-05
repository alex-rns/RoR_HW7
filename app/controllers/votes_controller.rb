class VotesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    @comment.votes.create!(author: current_author, vote_value: 1)
    redirect_to @post
  end

  private

  def votes_params
    params.require(:vote).permit(:author)
  end
end
