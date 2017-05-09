class MessagesController < ApplicationController

  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @users = @group.users
    @messages =Message.new
  end

  def create
  end

end
