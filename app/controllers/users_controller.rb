class UsersController < ApplicationController
  # before_action :authenticate_user!  dont need this as u wont be able to acces page with all of user's created events if u aint loggrd in 
  # ,except:[:index]
  def show
    # @user = User.find(params[:id])
    @user = current_user
    @created_events = @user.created_events
  end
end
