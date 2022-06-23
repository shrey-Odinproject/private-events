class EventsController < ApplicationController
  before_action :authenticate_user! ,except:[:index]
  def index
    @events = Event.all
  end

  def new
    @event = current_user.created_events.build(event_params)
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private
  def event_params
    params.require(:event).permit(:title, :location, :date)
  end
end
