class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: :home

  def home
    @hideouts = Hideout.all
  end

  def search
    @hideouts = Hideout.all
    if params[:query].present?
      # ancienne version du code ci dessous, ne fonctionne pas avec plusieurs mots
      # sql_subquery = "title ILIKE :query OR overview ILIKE :query OR address ILIKE :query"
      # @hideouts = @hideouts.where(sql_subquery, query: "%#{params[:query]}%")
      @results = PgSearch.multisearch(params[:query])
      @hideouts = @results.where(searchable_type: "Hideout").map { |searchable| Hideout.find(searchable.searchable_id) }
      users = @results.where(searchable_type: "User").map { |searchable| User.find(searchable.searchable_id) }
      users.each do |user|
        user.hideouts.each do |hideout|
          @hideouts << hideout unless @hideouts.include?(hideout)
        end
      end
    end
    render :home # cette liste pourrait etre supprimée en C/C le contenu de html home dans l'html search
  end
end
