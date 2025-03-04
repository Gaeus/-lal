class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: :home

  def home
    @hideouts = Hideout.all
  end
end
