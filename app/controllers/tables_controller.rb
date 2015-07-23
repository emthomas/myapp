class TablesController < ApplicationController
  before_action :set_table, only: [:show, :edit, :update, :destroy]

  # GET /tables
  # GET /tables.json
  def index
    @tables = Table.all
  end

  # GET /tables/1
  # GET /tables/1.json
  def show
  end

  # GET /tables/new
  def new
    @table = Table.new
  end

  # GET /tables/1/edit
  def edit
  end

  # POST /tables
  # POST /tables.json
  def create
    @table = Table.new(table_params)

    respond_to do |format|
      if @table.save
        format.html { redirect_to @table, notice: 'Table was successfully created.' }
        format.json { render :show, status: :created, location: @table }
      else
        format.html { render :new }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tables/1
  # PATCH/PUT /tables/1.json
  def update
    respond_to do |format|
      if @table.update(table_params)
        format.html { redirect_to @table, notice: 'Table was successfully updated.' }
        format.json { render :show, status: :ok, location: @table }
      else
        format.html { render :edit }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tables/1
  # DELETE /tables/1.json
  def destroy
    @table.destroy
    respond_to do |format|
      format.html { redirect_to tables_url, notice: 'Table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def empty
    new_table = Table.find(params[:id])
	#flash[:danger] = "#{new_table.users}"
	new_table.users.each do |user|
	   #flash[:danger] = "#{user}"
	   user.untable
	end
	redirect_to :back
  end
  
  def add_user
    new_table = Table.find(params[:id])
	new_user = User.find(params[:user_id])
	new_table.add_user(new_user)
    redirect_to :back
  end
  
  def remove_user
    new_user = User.find(params[:user_id])
    new_table = Table.find(params[:id])
    new_user.update_attribute(:table_id,null)
    redirect_to :back
  end
  
  def add_family
    new_family = Family.find(params[:family_id])
    new_table = Table.find(params[:id])
    new_family.not_seated.each do |new_user|
      answer = new_table.add_user(new_user)
	  if answer.nil?
	    flash[:danger] = "Flight to #{new_table.name} is now full. Find another destination for the other #{new_family.not_seated.size} guests."
	  end
	end
    redirect_to :back
  end
  
  def remove_family
    new_family = Family.find(params[:family_id])
    new_table = Table.find(params[:id])
	new_family.seated.each do |new_user|
		#new_user.update_attribute(:table_id,null)
	end
    redirect_to :back
  end

  def flip_theme
    new_user = current_user
    new_user.flip_theme
    respond_to do |format|
      format.html { redirect_to tables_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table
      @table = Table.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def table_params
      params.require(:table).permit(:number,:capacity)
    end
end
