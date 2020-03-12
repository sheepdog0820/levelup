class TweetsController < ApplicationController
  def index
    @tweet = Tweet.new
    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  # def create
  #   @message = @group.messages.new(message_params)
  #   if @message.save
  #     redirect_to group_messages_path(@group), notice: 'メッセージが送信されました'
  #   else
  #     @messages = @group.messages.includes(:user)
  #     flash.now[:alert] = 'メッセージを入力してください。'
  #     render :index
  #   end
  # end
  def create
    Tweet.create(tweet_params)
  end

  private
  def tweet_params
    params.require(:tweet).permit(:image, :content).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
