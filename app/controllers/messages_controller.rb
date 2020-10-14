class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    # チャットルームで紐付いたメッセージを生成する
    
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  def message_params
    
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
    # パラメーターの中にログインしているユーザーのidを結合させてcontentを受け取れるようにする
  end
end
