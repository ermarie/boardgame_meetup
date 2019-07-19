class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    binding.pry
    @game = Game.create(game_params)
    current_user.games << @game
    redirect_to game_path(@game)
  end

  def index
    @games = Game.all
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
    game = Game.find_by(id: params[:id])
    game.destroy
  end

  private

  def game_params
    params.require(:game).permit(:name, :min_play_time, :max_play_time, :min_num_players, :max_num_players, :min_age, :max_age,
      categories_attributes: [:category_ids, :name],
      mechanisms_attributes: [:mechanisms_ids, :name])
  end
end
