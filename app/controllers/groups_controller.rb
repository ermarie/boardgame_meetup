class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    group = Group.create(group_params)
    redirect_to group_path(group)
  end

  def index
    @groups = Group.all
    @user = User.find_by_id(params[:id])
  end

  def show
    @group = Group.find_by_id(params[:id])
  end

  def edit
    @group = Group.find_by_id(params[:id])
  end

  def update
    group = Group.find_by_id(params[:id])
    group.update(group_params)
    redirect_to group_path(group)
  end

  def delete
    group = Group.find_by_id(params[:id])
    group.destroy
  end

  
  private

    def group_params
      params.require(:group).permit(:name)
    end
end
