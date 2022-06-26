class InvitationsController < ApplicationController

  def new
    # 
    @invitation = Invitation.new
  end

  def create
    @invitation = current_user.invitations.build(invitations_params) # major step

    if @invitation.save
      flash[:success] = "U are now an attendee!"
      redirect_to root_path
    else
      flash.now[:error] = "Rats! Fix your mistakes, please."
      # no view exists for invitations so :new doesnot exist as well 
      render :new, status: :unprocessable_entity
    end

  end

  private
  
  def invitations_params
    # we pass the require information and name it attended_event_id cause that's what it is in the invitations table
    params.require(:invitation).permit(:attended_event_id)
  end
end
