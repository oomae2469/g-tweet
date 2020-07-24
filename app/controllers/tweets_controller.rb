class TweetsController < ApplicationController
  def top
  end

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    if Tweet.create(tweet_params)
      redirect_to :tweets
    else
      render :new
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:name, :image, :text)
  end
end
