class BookingsController < ApplicationController

  before_action :set_hideout

  def new
    @booking = Booking.new()
  end

  def create

    @booking = Booking.new(booking_params)
    @booking.hideout = @hideout
    @booking.user = current_user
    @booking.status = :pending
    if @booking.save
      redirect_to hideout_path(@hideout)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def accept
  #   @booking = Booking.find(params[:id])
  #   @booking.status = :accepted
  # end

  # def decline
  #   @booking = Booking.find(params[:id])
  #   @booking.status = :declined
  # end

  private

  def booking_params
    params.require(:booking).permit(:date_start, :date_end)
  end

  def set_hideout
    @hideout = Hideout.find(params[:hideout_id])
  end
end
