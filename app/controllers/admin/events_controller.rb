class Admin::EventsController < ApplicationController
  layout 'admin'
  
  before_action :set_event, only: [:show, :edit, :update]
  
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to admin_event_path(@event), notice: 'Event was successfully created.'
  end

  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event.update(event_params)
    redirect_to admin_event_path(@event), notice: 'Event was successfully updated.'
  end
  
  private
  def set_event
    @event = Event.find(params[:id])  
  end
  
  def event_params
    params.require(:event).permit(:title, :location, :start_at, :ticket_price, :ticket_quantity, :event_category_id)
  end
end
