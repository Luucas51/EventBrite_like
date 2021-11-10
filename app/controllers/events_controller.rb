class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
  end
  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
 
    if @event.update('start_date' => params[:start_date],
                    'duration' => params[:duration],
                    'description' => params[:description],
                    'location' => params[:location],
                    'price' => params[:price],
                    'title' => params[:title])
      redirect_to root_path, success: " Modification prise en compte! "
    else
      render :edit
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to root_path
  end


  def create
    @event = Event.new(
      title: event_params[:title],
      description: event_params[:description],
      start_date: event_params[:start_date],
      duration: event_params[:duration],
      price: event_params[:price],
      location: event_params[:location],
      user: current_user
    )
    if @event.save
      flash[:event_create] = "Event bien crée."
      redirect_to event_path(@event.id)
    else
      messages = []
      if @event.errors.any? 
        @event.errors.full_messages.each do |message| 
          messages << message
        end 
        flash[:event_error] = "Voici les erreurs : #{messages.join(" ")}"
        render 'new'
      end
    end
  end

  def show
    @event = Event.find(params[:id])
    @count_of_register = Event.find(params[:id]).users.all.count
    @participated = participated?
    @is_admin = is_admin?
  end

  private

  def event_params
    params.require(:events).permit(:title, :description, :start_date, :duration, :price, :location, :user)
  end

  def participated?
    if current_user
    Event.find(params['id']).users.ids
    end
  end

  def is_admin?
    current_user == Event.find(params['id']).user
  end
end
