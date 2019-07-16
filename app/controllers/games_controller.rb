class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
  end

  def index
    @user = User.find_by(name: session[:name])
    @games = @user.games
  end

  def show
    @game = Game.find_by(id: params[:id])
  end

  def edit
    @game = Game.find_by(id: params[:id])
  end

  def update
  end

  def destroy
  end
end
