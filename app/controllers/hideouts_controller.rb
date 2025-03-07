
class HideoutsController < ApplicationController

  skip_before_action :authenticate_user!, only: :show 

  def show
    @hideout = Hideout.find(params[:id])
    @booking = Booking.new
    @bookings_dates = @hideout.bookings.reject{ |booking| booking.status == "declined"}.map { |booking| [booking.date_start, booking.date_end] }
  end

  def new
    @hideout = Hideout.new

  end

  def create
    @hideout = Hideout.new(hideout_params)
    @hideout.user = current_user
    if @hideout.save
      redirect_to @hideout
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @hideout = Hideout.find(params[:id])
  end

  def update
    @hideout = Hideout.find(params[:id])
    @hideout.update(hideout_params)
    redirect_to hideout_path(@hideout)
  end

  def destroy
    @hideout = Hideout.find(params[:id])
    @hideout.destroy
    redirect_to root_path
  end


  private

  def hideout_params
    params.require(:hideout).permit(:title, :address, :price, :overview, :cover_picture, pictures:[])
  end
end
