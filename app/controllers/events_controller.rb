class EventsController < ApplicationController
  before_action :authenticate_user! ,except:[:index]
  def index
    @past_events = Event.past
    @future_events = Event.future
  end

  def new
    @event = Event.new
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
