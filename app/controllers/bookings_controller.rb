class BookingsController < ApplicationController
  before_action :set_hideout, only: [:new, :create]
  before_action :set_booking, only: [:accept, :decline]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.hideout = @hideout
    @booking.user = current_user
    number_of_nights = (@booking.date_end - @booking.date_start).to_i
    @booking. price = number_of_nights * @hideout.price
    @booking.status = "pending"
    if @booking.save
      redirect_to hideout_path(@hideout)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def accept
    @booking.update(status: "accepted")
    redirect_to dashboard_path(), notice: "Booking accepted!"
  end

  def decline
    @booking.update(status: "declined")
    redirect_to dashboard_path(), alert: "Booking declined!"
  end

  private

  def booking_params
    params.require(:booking).permit(:date_start, :date_end)
  end

  def set_hideout
    @hideout = Hideout.find(params[:hideout_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

end
