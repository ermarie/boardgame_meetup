class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
    @groups = @user.groups
    @events = @user.events
  end

  def one_day
    @user = current_user
    @groups = @user.groups
    @events = @user.events.within_1_day
    render :show
  end

  def seven_days
    @user = current_user
    @groups = @user.groups
    @events = @user.events.within_7_days
  end

  def thirty_days
    @user = current_user
    @groups = @user.groups
    @events = @user.events.within_30_days
  end

end
