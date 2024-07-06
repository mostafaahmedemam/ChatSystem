class ChatsController < ApplicationController
    def create
      @application = Application.find_by(token: params[:application_id])
      @chat = @application.chats.build
  
      if @chat.save
        render json: { chat_number: @chat.number }, status: :created
      else
        render json: @chat.errors, status: :unprocessable_entity
      end
    end
  
    def show
      @application = Application.find_by(token: params[:application_id])
      @chat = @application.chats.find_by(number: params[:id])
      render json: @chat
    end
  end
  