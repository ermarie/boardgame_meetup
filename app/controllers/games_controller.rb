class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.save
    if @game.valid?
      current_user.games << @game
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def index
    @games = Game.all
    if @games.empty?
      redirect_to new_game_path
    end
  end

  def show
    @game = Game.find_by(id: params[:id])
  end

  def kid_friendly
    @games = Game.kid_friendly
    @kf = true
    render :index
  end

  def edit
    @game = Game.find_by(id: params[:id])
  end

  def update
    @game = Game.new(game_params)
    @game.save
    if @game.valid?
      current_user.games << @game
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def destroy
    game = Game.find_by(id: params[:id])
    game.destroy
  end

  private

  def game_params
    params.require(:game).permit(:name, :min_play_time, :max_play_time, :min_num_players, :max_num_players, :min_age, :max_age)
  end
end
