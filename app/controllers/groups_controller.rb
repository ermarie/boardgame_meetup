class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      current_user.groups << @group
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def index
    @groups = Group.all
    @user = current_user
    @kf == false
  end

  def show
    @group = Group.find_by_id(params[:id])
  end

  def join
    @group = Group.find_by_id(params[:group_id])
    binding.pry
    current_user.groups << @group
    redirect_to group_path(@group)
  end

  def leave
    @group = Group.find_by_id(params[:group_id])
    current_user.groups.delete(@group)
    redirect_to groups_path
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
