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

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to :tweets
    else
      render :edit
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.destroy
      redirect_to :tweets
    end
  end


  private
  def tweet_params
    params.require(:tweet).permit(:name, :image, :text)
  end
end
