class PlaysController < ApplicationController
  def new
    @game = Game.find(params["game_id"])
    @play = @game.plays.build(user_id: current_user.id)
  end
  
  def create
    @play = Play.new(play_params)
    game = Game.find(@play.game_id)
    if @play.save
      redirect_to game_path(game)
    else
      render :new
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
    @play = Play.new(play_params)
    if @play.save
      redirect_to game_play_path(@play)
    else
      render :edit
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
