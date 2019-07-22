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
    @games = Game.all
    if @games.empty?
      redirect_to new_game_path
    end
  end

  def show
    @game = Game.find_by(id: params[:id])
    @ties == false
  end

  def ties
    @game = Game.find_by(id: params[:game_id])
    @plays = @game.plays.ties
    if @plays.empty? 
      redirect_to game_path(@game)
    else
      @ties = true
      render :show
    end
  end

  def kid_friendly
    @games = Game.all.kid_friendly
    @kf = true
    render :index
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
