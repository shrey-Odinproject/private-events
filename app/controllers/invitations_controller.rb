class InvitationsController < ApplicationController

  def create
    current_event = Event.find(params[:event_id]) # we maually pass event_id in params (check event#show view)
    @invitation = current_user.invitations.build(attended_event_id: current_event.id)

    if @invitation.save
      flash[:notice] = "U are now an attendee!"
      redirect_to user_path(current_user)
    else
      flash.now[:notice] = "Couldn't attend due to an error"
      redirect_back fallback_location: '/events'
    end

  end

  def destroy
    current_event = Event.find(params[:event_id])
    @invitation = current_user.invitations.find_by('attended_event_id = ?', current_event.id)

    @invitation.destroy
    redirect_back fallback_location: "/events/#{current_event.id}"
  end

end
