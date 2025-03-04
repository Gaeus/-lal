class HideoutsController < ApplicationController

  skip_before_action :authenticate_user!, only: :show


  def show
    @hideout = Hideout.find(params[:id])
  end

  def new
    @hideout = Hideout.new()
  end

  def create
    @hideout = Hideout.new(hideout_params)
    if @bookmark.save
      redirect_to @hideout
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
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
    params.require(:hideout).permit(:title, :address, :price, :overview, :cover_picture, :pictures, :is_public?)
  end
end
