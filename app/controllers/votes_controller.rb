class VotesController < ApplicationController
  before_action :set_post
  before_action :set_comment

  def create
    if @comment.votes.create!(author: current_author, vote_value: 1)
      render 'votes/vote'
    else
      redirect_to @post
    end
  end

  def dislike
    if @comment.votes.create!(author: current_author, vote_value: -1)
      render 'votes/vote'
    else
      redirect_to @post
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end

  def votes_params
    params.require(:vote).permit(:author)
  end
end
