class TweetsController < ApplicationController
  before_action :set_tweet, only: [:destroy]

  def index
    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    @chart = {"国語" => 10, "算数" => 20, "理科" => 30, "社会" => 40}
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :index
    end
  end


  def destroy
    if @tweet.destroy
      redirect_to root_path, notice: '削除に成功しました。'
    else
      flash.now[:alert] = '削除に失敗しました。'
      redirect_to root_path      
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:image, :content, :tag_list).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

end
