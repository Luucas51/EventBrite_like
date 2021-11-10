class ChargesController < ApplicationController
  def new
    @event = Event.find(params[:attendance_id])
  end

  def create
    @amount = Event.find(params[:event_id]).price * 100

    @attendance = Attendance.new
    @attendance.user_id = current_user.id
    @attendance.event_id = Event.find(params['event_id']).id

    if @attendance.save
      redirect_to event_attendance_path(id: params['event_id'])
      flash[:pay_success] = "Paiement ok"
    end

    # Amount in cents
    @amount = 500
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
  
end
