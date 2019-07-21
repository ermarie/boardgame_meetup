class GamesController < ApplicationController

  def new
    @game = Game.new
    @category = @game.categories_games.build.build_category
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

  def ties
    @game = Game.find_by(id: params[:id])
    @ties = @game.plays.ties
    redirect_to game_ties_path(@ties)
  end

  def edit
    binding.pry
    @game = Game.find_by(id: params[:id])
  end

  def update
    binding.pry
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
    params.require(:game).permit(:name, :min_play_time, :max_play_time, :min_num_players, :max_num_players, :min_age, :max_age, category_ids: [],
      categories_attributes: [:name]
      )
  end
end
