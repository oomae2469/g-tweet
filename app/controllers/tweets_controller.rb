class TweetsController < ApplicationController
  def top
  end

  def index
    @tweets = Tweet.all
  end
end
