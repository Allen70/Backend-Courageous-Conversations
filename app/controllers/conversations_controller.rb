class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :update, :destroy]

  def index
    @conversations = Conversation.all

    render json: @conversations
  end


  def show
    render json: @conversation
  end


  def create
    @conversation = Conversation.new(conversation_params)

    if @conversation.save
      render json: @conversation, status: :created, location: @conversation
    else
      render json: @conversation.errors, status: :unprocessable_entity
    end
  end


  def update
    if @conversation.update(conversation_params)
      render json: @conversation
    else
      render json: @conversation.errors, status: :unprocessable_entity
    end
  end


  def destroy
    @conversation.destroy
  end

  private
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end


    def conversation_params
      params.require(:conversation).permit(:name)
    end
end
