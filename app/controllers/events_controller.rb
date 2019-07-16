class EventsController < ApplicationController
  def new
    @group = Group.find_by(id: params[:id])
    @event = group.events.build
  end

  def create
    @group = Group.find_by(id: params[:id])
    @events = group.events.build(event_params)
  end

  def index
    @group = Group.find_by(id: params[:id])
    @events = group.events
  end

  def show
    @event = Event.find_by(parmas[:id])
  end

  def edit
  end

  def delete
  end

  private

  def event_params
    params.require(:event).permit(:name)
  end
end
