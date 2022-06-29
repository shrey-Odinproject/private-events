class InvitationsController < ApplicationController
  # removed the new method because @invitation was never used in any view, we needed instance of invitation to create a form in 
  #other controller's view (event) so we directly created an instance there in view itself rather than use @invitation created in 
  # controller#new 

  # def new
  #   @invitation = Invitation.new
  # end

  def create
    @invitation = current_user.invitations.build(invitations_params) # major step

    if @invitation.save
      flash[:success] = "U are now an attendee!"
      redirect_to user_path(current_user)
    else
      flash.now[:error] = "Rats! Fix your mistakes, please."
      # no view exists for invitations so :new doesnot exist as well 
      render :new, status: :unprocessable_entity
    end

  end

  def destroy
    #params[id] gives the argument in view's @invitation variable isnt used in destroying
    # because button directs here params[:id] becomes that of the invitation so we simply use that to get the invitation we wanna delete
    @invitation = Invitation.find(params[:id]) 
    @invitation.destroy

    redirect_to user_path(current_user), status: :see_other
  end

  private
  
  def invitations_params
    # we pass the require information and name it attended_event_id cause that's what it is in the invitations table
    params.require(:invitation).permit(:attended_event_id)
  end
end
