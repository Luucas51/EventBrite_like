class Admin::EventsController < ApplicationController
    def index

    end
    
    def show 
        @event = Event.find(params[:id])
    end

    def update
        @event = Event.find(params[:id])
 
        if @event.update('title' => params[:title],
                        'description' => params[:description],
                        'price' => params[:price])
        redirect_to admin_event_path(@event.id)
        else
          render :edit
        end
    
    end

    def edit
        @event = Event.find(params[:id])
    end


    def destroy
        Event.find(params[:id]).destroy
        redirect_to admin_index_path
    end

end
