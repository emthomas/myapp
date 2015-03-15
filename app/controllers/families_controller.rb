class FamiliesController < ApplicationController
  def new
  end

  def create
  end

  def update
  end

  def index
  	@families = Family.joins("LEFT OUTER JOIN users on families.id = users.family_id")
       				  .select("families.id, families.family_name, COUNT(DISTINCT users.id) as member_count")
       				  .group("families.id, families.family_name")
       				  .order("#{params[:by]} #{params[:dir]}")
       				  .order("family_name")
       				  .paginate(page: params[:page])
  end
  
  def destroy
    members = User.where("family_id = #{params[:id]}").count
    if members > 0
    	flash[:danger] = "Please change or delete all #{members} member(s) of this family first"
    else 
    	Family.find(params[:id]).destroy
    	flash[:success] = "Family deleted"
    end
    redirect_to families_url
  end
  
  def sort
  end
  
  def show
    @family = Family.find(params[:id])
    @family_members = User.where("family_id = #{params[:id]}")
    					  .joins("LEFT OUTER JOIN families on families.id = users.family_id")
       				      .select("users.*, families.family_name")
                    	  .order(:last_name)
                    	  #.paginate(page: params[:page])
  end
end
