class ChatMessagesController < ApplicationController
  before_action :set_chat_message, only: [:show, :edit, :update, :destroy]
  before_action :set_user,except: [:new]#, only: [:show, :edit, :update, :destroy]


  # GET /chat_messages
  # GET /chat_messages.json
  def index
    # @chat_messages = ChatMessage.all

    if params[:chat_room_id].present?
      @chat_room = ChatRoom.find(params[:chat_room_id])
    else
      if current_user.present?
        @user_chat_rooms = current_user.chat_rooms_as_sender + current_user.chat_rooms_as_reciever
      elsif current_super_admin.present?
        @user_chat_rooms = current_super_admin.chat_rooms_as_sender + current_super_admin.chat_rooms_as_reciever
      end        
      @common_chat_rooms = @user_chat_rooms.select{ |cr| cr.senderable == @user || cr.recieverable == @user }
      if @common_chat_rooms.first.present?
        @chat_room = @common_chat_rooms.first
      else
        @chat_room = ChatRoom.create(senderable: current_user || current_super_admin, recieverable: @user )
      end
    end
    @chat_messages = @chat_room.chat_messages
  end

  # GET /chat_messages/1
  # GET /chat_messages/1.json
  def show
  end

  # GET /chat_messages/new
  def new
    @chat_message = ChatMessage.new
  end

  # GET /chat_messages/1/edit
  def edit
  end

  # POST /chat_messages
  # POST /chat_messages.json
  def create
    @chat_message = ChatMessage.new(chat_message_params)

    respond_to do |format|
      if @chat_message.save
        if @chat_message.senderable_type == "SuperAdmin"
        format.html { redirect_to chat_messages_path(admin_user_id: @chat_message.senderable.id, chat_room_id: @chat_message.chat_room_id), notice: 'Chat message was successfully created.' }
        elsif @chat_message.senderable_type == "User"
          format.html { redirect_to chat_messages_path(user_id: @chat_message.senderable.id, chat_room_id: @chat_message.chat_room_id), notice: 'Chat message was successfully created.' }
        end
        format.json { render :show, status: :created, location: @chat_message }
      else
        format.html { render :new }
        format.json { render json: @chat_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chat_messages/1
  # PATCH/PUT /chat_messages/1.json
  def update
    respond_to do |format|
      if @chat_message.update(chat_message_params)
        format.html { redirect_to @chat_message, notice: 'Chat message was successfully updated.' }
        format.json { render :show, status: :ok, location: @chat_message }
      else
        format.html { render :edit }
        format.json { render json: @chat_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chat_messages/1
  # DELETE /chat_messages/1.json
  def destroy
    @chat_message.destroy
    respond_to do |format|
      format.html { redirect_to chat_messages_url, notice: 'Chat message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat_message
      @chat_message = ChatMessage.find(params[:id])
    end

    def set_user
      if params[:user_id].present?
        @user = User.find(params[:user_id])
      elsif params[:admin_user_id].present?
        @user = SuperAdmin.find(params[:admin_user_id])
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def chat_message_params
      params.require(:chat_message).permit(:chat_room_id, :message,:senderable_type, :senderable_id)
    end
end
