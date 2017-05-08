class MessagesController < ApplicationController
  before_action :groups

  def index
  	
  end

  def new
    @group = Group.find(params[:group_id])
    @users = @group.users
  end

  def groups
  	@groups = current_user.groups
  end

end
