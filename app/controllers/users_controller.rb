class UsersController < ApplicationController
  before_action :authenticate_user!  
  def show
    @user = current_user # if we dont authenticate then there is no current_user and error happen
    @created_events = @user.created_events
  end
end
