class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
    @events = @user.events
    @games = @user.games.uniq
  end

end
