class PlaysController < ApplicationController

  def update
    binding.pry
    play = Play.find(params[:id])
    @game = Game.find(params[:game_id])
    num = play.num_plays
    num = num + 1
    play.update(num_plays: num)
    play.save
    redirect_to game_path(@game)
  end

end
