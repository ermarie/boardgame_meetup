class GamesController < ApplicationController
  
  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
    current_user.games << @game
    redirect_to game_path(@game)
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
    @game = Game.find_by(id: params[:id])
    if @game.update(game_params)
      redirect_to game_path(@game)
    else
      redirect_to edit_game_path(@game)
    end
  end

  def destroy
  end

  private

  def game_params
    params.require(:game).permit(:name, :min_play_time, :max_play_time, :min_num_players, :max_num_players, :min_age, :max_age)
  end
end
