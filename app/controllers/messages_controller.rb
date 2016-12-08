class MessagesController < ApplicationController
  before_action :authenticate_request!
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages
    
    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true;
      end
    end
    render json: @messages

  end
  def new
    @message = @conversation.messages.new
  end
#create a message, if message is created a message will display indicating that the message was created
  def create
    @message = @conversation.messages.new(user_id: current_user.id, body: params[:body], conversation_id: params[:conversation_id])
    if @message.save
      #redirect_to conversation_messages_path(@conversation)
      render json: "{message created}"
    end
  end

private
  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
