class PlaysController < ApplicationController
  def new
    binding.pry
    @play = Play.new(game_id: params["game_id"])
    binding.pry
  end
  
  def create
    @play = Play.find_by(id: params[:id])
    binding.pry
    if @play.update(play_params)
      redirect_to game_play_path(@play)
    else
      redirect_to edit_game_play_path(@play)
    end
  end
  
  def show
    @play = Play.find_by(id: params[:id])
  end

  def edit
    @play = Play.find_by(id: params[:id])
    binding.pry
  end

  def update
    @play = Play.find_by(id: params[:id])
    @play.update(play_params)
    if @play.valid?
      redirect_to game_play_path(@path)
    else
      redirect_to edit_game_play_path(@path)
    end
  end

  def delete
    play = Play.find_by(id: params[:id])
    game = play.game
    play.destroy
    redirect_to game_path(game)
  end

  private

  def play_params
    params.require(:play).permit(:minutes_played, :winner, :user_id, :game_id)
  end
end
