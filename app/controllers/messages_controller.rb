class MessagesController < ApplicationController
  before_action :authenticate_request!
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    #@messages = @conversation.messages
    #if @messages.length > 10
     # @over_ten = true
      #@messages = @messages[-10..-1]
    #end
    #if params[:m]
     # @over_ten = false
      #@messages = @conversation.messages
    #end
    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true;
      end
    end

    @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.new
  end

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