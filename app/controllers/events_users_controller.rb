class EventsUsersController < ApplicationController

    def create
        binding.pry
        @event = Event.find_by_id(params[:event_id])
        current_user.events << @event
        redirect_to event_path(@event)
      end
    
      def destroy
        binding.pry
        event = Event.find_by_id(params[:event_id])
        current_user.events.delete(event)
        redirect_to user_path(current_user)
      end

end