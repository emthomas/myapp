class FamiliesController < ApplicationController
  def new
    if params[:commit]
    	@family = Family.create(family_name: params[:family_name])
							
    	if @family.save
  			flash[:success] = @family.family_name+" was Added"
  		else
  			flash[:danger] = "There was an error"
  		end
  		
  		redirect_to families_path
    else
    	@family = Family.new
    end
  end

  def create
    @family = Family.new(family_params)    # Not the final implementation!
    if @family.save 
      if logged_in_admin?
        flash[:success] = "#{@family.family_name} Created"
    	redirect_to families_path
      else 
      	redirect_to root_url
      end
    else
      render 'new'
    end
  end

  def update
    @family = Family.find(params[:id])
    if @family.update_attributes(family_params)
      flash[:success] = "#{@family.family_name}'s family updated"
      redirect_to families_path
    else
      render 'edit'
    end
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
       @available_tables = Table.joins("LEFT OUTER JOIN users on users.table_id = tables.id").group(:number).having("count(*)<max(capacity)")

  end
  
  def edit
    @family = Family.find(params[:id])
  end
  
  def untable
    @family = Family.find(params[:id])
    @family.untable
    redirect_to :back
  end
  
  private

    def family_params
     params.require(:family).permit!
    end
end
