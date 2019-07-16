class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    group = Group.create(name: params["name"])
    redirect_to group_path(group)
  end

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find_by(id: params[:id])
  end
end
