class GroupsController < ApplicationController

  before_action :set_group, only: [:edit, :update]

  def index
    @groups = current_user.groups
  end 

  def new
    @group = Group.new
  end 

  def create
    group = Group.new(post_params)
    if group.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(group), notice: 'グループを作成しました' }
        format.json
      end
    else
      flash.now[:alert] = 'グループの作成に失敗しました'
      render :new
    end
  end

  def search
    binding.pry
    @users = User.where('name LIKE(?)', "%#{params[:name]}%")
    render json: @users
  end

  def edit
  end

  def update
    if @group.save
      redirect_to group_messages_path(@group), notice: 'グループを編集しました'
    else 
      flash.now[:alert] = 'グループの編集に失敗しました'
      render :new
    end
  end

  private

  def post_params
    params.require(:group).permit(:name, user_ids:[])
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
