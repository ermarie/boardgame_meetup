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
  end

  def show
    @group = Group.find_by(id: params[:id])
  end

  
  private

    def group_params
      params.require(:group).permit(:name)
    end
end
