class GroupsController < ApplicationController
 
  def new
    @group = Group.new


  end 

  def create
    group = Group.new(post_params)
    if  group.save
    redirect_to root_path, notice: 'グループを作成しました'
    else
    flash.now[:alert] = 'グループの作成に失敗しました'
    render :new
    end
  end
    
  def show
    @groups = Group.all
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.new(post_params)
    if  group.save
    redirect_to group_path, notice: 'グループを編集しました'
    else
    flash.now[:alert] = 'グループの編集に失敗しました'
    render :new
    end
  end

private

def post_params
  params.require(:group).permit(:name, {:user_ids => []})
end

end
