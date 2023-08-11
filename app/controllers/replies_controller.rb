class RepliesController < ApplicationController
  def create
    @tweet = Tweet.find(params[:tweet_id])
    @reply = @tweet.replies.create(reply_params)
    @reply.user = current_user

    @reply.save
    redirect_to tweet_path(@tweet)
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @reply = @tweet.replies.find(params[:id])
    
    @reply.destroy
    redirect_to tweet_path(@tweet)
  end

  private
  def reply_params
    params.require(:reply).permit(:content)
  end
end
