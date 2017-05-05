class GroupsController < ApplicationController
 
def new
end 

def edit
end

def create
end

end

def show
  @groups = Group.all
  @group = Group.find(params[:id])
  @users = Group.find(params[:id]).users
end