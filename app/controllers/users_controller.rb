class UsersController < ApplicationController
  def show
    binding.pry
    @user = User.find_by(id: params[:id])
  end
end
