class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    content = Content.find(params[:content_id])
    vote = content.votes.find_or_initialize_by(user: current_user)

    if vote.value == params[:value].to_i
      vote.destroy
      user_vote = nil
    else
      vote.update(value: params[:value])
      user_vote = vote.value
    end

    render json: {
      upvotes: content.upvotes_count,
      downvotes: content.downvotes_count,
      userVote: user_vote
    }
  end
end
