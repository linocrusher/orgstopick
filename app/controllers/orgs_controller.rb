class OrgsController < ApplicationController
  def index
    @orgs = Org.all.paginate(page: params[:page], per_page: 10)
    if params[:noa] == "1"
      @orgs = Org.where("name like ?", "%" + params[:keyword] + "%").paginate(page: params[:page], per_page: 10)
    elsif params[:noa] == "2"
      @orgs = Org.where("acronym like ?", "%" + params[:keyword] + "%").paginate(page: params[:page], per_page: 10)
    elsif params[:noa] == "3"
      @orgs = Org.where("college like ?", "%" + params[:keyword] + "%").paginate(page: params[:page], per_page: 10)
    elsif params[:noa] == "4"
      @orgs = Org.where("department like ?", "%" + params[:keyword] + "%").paginate(page: params[:page], per_page: 10)
    end
  end

  def show
    if params[:id] == "contact"
      render 'contact'
    else
      @org = Org.find(params[:id])
      @ratings = Rating.where(:org => @org).paginate(page: params[:page], per_page: 10)
      @ctot = 0
      @ptot = 0
      @stot = 0
      @atot = 0
      if @ratings.count > 0
        @ratings.each do |r|
          @ctot = @ctot + r.community
          @ptot = @ptot + r.purpose
          @stot = @stot + r.selfbenefit
          @atot = @atot + r.application
        end
        @ctot = (@ctot.to_f / @ratings.count)
        @ptot = (@ptot.to_f / @ratings.count)
        @stot = (@stot.to_f / @ratings.count)
        @atot = (@atot.to_f / @ratings.count)
        @otot = (@ctot + @ptot + @stot + @atot) / 4
        @org.update(:rating => @otot)
      end
    end
  end

  def new
    @org = Org.new
  end

  def create
    @org = Org.new(org_params)

    if @org.save
      redirect_to @org
    else
      render 'new'
    end
  end

  private
  def org_params
    params.require(:org).permit(:name, :acronym, :college, :department, :scope, :description, :noa, :keyword, :contact)
  end
end
