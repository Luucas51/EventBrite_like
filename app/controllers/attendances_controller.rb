class AttendancesController < ApplicationController
  def new
    @amount = Event.find(params[:event_id]).price * 100
    @event = Event.find(params[:event_id])
  end
  def index
  end
  def show
  end
  def create
  end
end
