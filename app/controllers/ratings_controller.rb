class RatingsController < ApplicationController
  def new
    @org = Org.find(params[:id].to_i)
  end

  def create
    puts rating_params
    @org = Org.find(params[:org].to_i)
    @rating = Rating.new(rating_params)
    @rating.update(:org => @org)
    @rating.save
    redirect_to @org
  end

  private
  def rating_params
    params.require(:rating).permit(:community, :purpose, :selfbenefit, :application, :details, :org)
  end

end
