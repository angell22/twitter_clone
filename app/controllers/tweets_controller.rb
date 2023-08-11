class TweetsController < ApplicationController
  def index
    @tweets = Tweet.order(created_at: :desc)
    @tweet = current_user.tweets.build if user_signed_in?
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @tweet = Tweet.new
    @replies = @tweet.replies.order(created_at: :desc)
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)

    if @tweet.save
      redirect_to tweets_path, notice: "Tweet posted successfully!"
    else
      flash.now[:alert] = "Error posting tweet."
      render :index
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    
    @tweet.destroy
    redirect_to tweets_path
  end

  private
  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
