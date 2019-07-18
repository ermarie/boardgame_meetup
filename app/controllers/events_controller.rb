class EventsController < ApplicationController
  def new
    @group = Group.find_by_id(params[:group_id])
    @event = @group.events.build
  end

  def create
    @group = Group.find_by_id(params[:group_id])
    @event = @group.events.build(event_params)
    @event.save
    if @event.valid?
      redirect_to group_event_path(@event.group, @event)
    else
      redirect_to new_group_event_path
    end
  end

  def show
    @event = Event.find_by_id(params[:id])
    if !@event.group.users.include?(current_user)
      redirect_to group_path(@event.group)
    end
  end

  def join
    @event = Event.find_by_id(params[:id])
    current_user.events << @event
    redirect_to group_event_path(@event)
  end

  def leave
    event = Event.find_by_id(params[:id])
    group = event.group
    current_user.events.delete(event)
    redirect_to group_path(group)
  end

  def edit
    @event = Event.find_by_id(params[:id])
  end

  def update
    @event = Event.find_by_id(params[:id])
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def delete
    event = Event.find_by_id(params[:id])
    event.destroy
    redirect_to user_path(current_user)
  end

  private

  def event_params
    params.require(:event).permit(:name, :date_time)
  end
end
