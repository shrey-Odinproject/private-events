class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user # if we dont authenticate then there is no current_user and error happen
    @created_events = @user.created_events
  end

  def invite
    @user_to_add = params[:user_id]
    @creator = User.find(params[:creator_id])
    @creator.invited |= [@user_to_add.to_s] # add only if not already included
    @creator.save

    flash[:notice] = "Invite sent!"
    redirect_to root_path
  end
end
