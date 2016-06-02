class Api::EventsController < ApplicationController

  def index
    render json: { events: Event.all}
  end

  def create
    newEvent = Event.create event_params
    render json: { eventObject: newEvent }

  end


  def destroy

  end

  private

  def event_params
    params.require(:eventObject).permit(:date, :time, :title, :description, :location, :url, :image_url)
  end

end
