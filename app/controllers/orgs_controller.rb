class OrgsController < ApplicationController
  def index
    @orgs = Org.all
  end

  def show
    @org = Org.find(params[:id])
    @ratings = Rating.where(:org => @org)
  end

  def new
  end

  def create
    @org = Org.new(org_params)

    @org.save
    redirect_to @org
  end

  private
  def org_params
    params.require(:org).permit(:name, :acronym, :college, :department, :scope, :description)
  end
end
