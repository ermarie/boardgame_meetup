class UsersController < ApplicationController
  def show
    binding.pry
    @user = User.find_by_id(params[:id])
    @group = @user.group
    @events = @user.events

  end

end
