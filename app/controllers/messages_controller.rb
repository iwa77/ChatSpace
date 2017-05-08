class MessagesController < ApplicationController

  def index
    @groups = current_user.groups
  end

  def new
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @users = @group.users
  end


end
