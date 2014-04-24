class MessagesController < ApplicationController
  def index
    @messages = current_user.messages
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to messages_path, notice: "Successfully sent message!"
    else
      render 'new', notice: "Please enter a valid message"
    end
  end

  private
  def message_params
    recipient = User.where(username: params[:message][:recipient]).first
    params.require(:message).permit(:recipient, :subject, :body).merge(sender: current_user, recipient: recipient)
  end
end
