class ConversationsController < ApplicationController
  before_action :authenticate_request!

  def index
    @users = User.all
    render json: @users
  end

  def create
    sender_id = current_user.id
    recipient_id = User.where(email:params[:recipient_email])[0][:id]
    if Conversation.between(sender_id,recipient_id).present?
      @conversation = Conversation.between(sender_id, recipient_id).first
    else
      @conversation = Conversation.create!(sender_id: sender_id, recipient_id: recipient_id)
    end
    render json: "{\"conversation_id\":#{@conversation.id}}"
    #redirect_to conversation_messages_path(@conversation)
  end
  

private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end