class MechanismsController < ApplicationController
  def show
    @mechanism = Mechanism.find_by_id(params[:id])
  end
end
