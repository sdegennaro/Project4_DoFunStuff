class Api::EventsController < ApplicationController

  include SessionsHelper

  def index
    render json: { events: Event.all}
  end

  before_action :authenticate!

  def create
    newEvent = Event.create event_params
    render json: { eventObject: newEvent }

  end


  def destroy

  end

  private

  def event_params
    params.require(:event).permit(:date, :time, :title, :description, :location, :url, :image_url)
  end

end
