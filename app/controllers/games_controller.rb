class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
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

  private

  def event_params
    params.require(:game).permit(:name, :min_play_time, :max_play_time, :min_num_players, :max_num_players, :min_age, :max_age)
  end
end
