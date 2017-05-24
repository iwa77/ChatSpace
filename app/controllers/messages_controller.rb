class MessagesController < ApplicationController

  def index
    @groups = current_user.groups.order(created_at: :DESC)
    @group = Group.find(params[:group_id])
    @users = @group.users
    @messages = @group.messages.order(created_at: :ASC).includes(:user)
    @message = Message.new
      respond_to do |format|
        format.html
        format.json {@messages = @group.messages.where('id > ?', params[:lastId])}
      end
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(params[:group_id]), notice: 'メッセージを投稿しました' }
        format.json
      end
    else
      flash.now[:alert] = "メッセージを入力してください"
      render :index
    end
  end

  private

  def message_params
      params.require(:message).permit(:body, :image).merge(group_id: params[:group_id])
  end

end
