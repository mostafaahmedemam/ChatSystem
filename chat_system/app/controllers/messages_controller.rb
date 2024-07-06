class MessagesController < ApplicationController
    def create
      @application = Application.find_by(token: params[:application_id])
      @chat = @application.chats.find_by(number: params[:chat_id])
      @message = @chat.messages.build(message_params)
  
      if @message.save
        render json: { message_number: @message.number }, status: :created
      else
        render json: @message.errors, status: :unprocessable_entity
      end
    end
  
    def index
      @application = Application.find_by(token: params[:application_id])
      @chat = @application.chats.find_by(number: params[:chat_id])
      @messages = @chat.messages
      render json: @messages
    end
  
    def search
      @chat = Chat.find(params[:chat_id])
      @messages = @chat.messages.search(params[:q]).records
      render json: @messages
    end
  
    private
  
    def message_params
      params.require(:message).permit(:body)
    end
  end
  