class UsersController < ApplicationController
  before_action :authenticate_user! 
  # ,except:[:index]
  def show
    # @user = User.find(params[:id])
    @user = current_user
    @events = @user.created_events
  end
end
