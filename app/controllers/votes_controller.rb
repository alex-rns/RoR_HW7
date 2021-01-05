class VotesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    if @comment.votes.create!(author: current_author, vote_value: 1)
      render 'votes/vote'
    else
      redirect_to @post
    end
  end

  def dislike
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    if @comment.votes.create!(author: current_author, vote_value: -1)
      render 'votes/vote'
    else
      redirect_to @post
    end
  end

  private

  def votes_params
    params.require(:vote).permit(:author)
  end
end
