class GroupsController < ApplicationController

  before_action :set_group, only: [:edit, :update]
 
  def new
    @group = Group.new
  end 

  def create
    group = Group.new(post_params)
    if  group.save
     redirect_to new_group_message_path(group), notice: 'グループを作成しました'
    else
     flash.now[:alert] = 'グループの作成に失敗しました'
     render :new
    end
  end
    
  def edit
  end

  def update
    if  @group.save
     redirect_to new_group_message_path(@group), notice: 'グループを編集しました'
    else 
     flash.now[:alert] = 'グループの編集に失敗しました'
     render :new
    end
  end

  private

  def post_params
    params.require(:group).permit(:name, {user:{ids:[]}})
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
