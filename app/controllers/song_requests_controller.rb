class SongRequestsController < ApplicationController
  before_action :set_song_request, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:destroy, :index, :show]

  # GET /song_requests
  # GET /song_requests.json
  def index
    @song_requests = SongRequest.all
  end

  # GET /song_requests/1
  # GET /song_requests/1.json
  def show
  end

  # GET /song_requests/new
  def new
    @song_request = SongRequest.new
  end

  # GET /song_requests/1/edit
  def edit
  end

  # POST /song_requests
  # POST /song_requests.json
  def create
    @song_request = SongRequest.new(song_request_params)

    respond_to do |format|
      if @song_request.save
        format.html { redirect_to @song_request, notice: 'Song request was successfully created.' }
        format.json { render :show, status: :created, location: @song_request }
      else
        format.html { render :new }
        format.json { render json: @song_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /song_requests/1
  # PATCH/PUT /song_requests/1.json
  def update
    respond_to do |format|
      if @song_request.update(song_request_params)
        format.html { redirect_to @song_request, notice: 'Song request was successfully updated.' }
        format.json { render :show, status: :ok, location: @song_request }
      else
        format.html { render :edit }
        format.json { render json: @song_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /song_requests/1
  # DELETE /song_requests/1.json
  def destroy
    @song_request.destroy
    respond_to do |format|
      format.html { redirect_to song_requests_url, notice: 'Song request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song_request
      @song_request = SongRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_request_params
      params.require(:song_request).permit(:name, :author, :user_id)
    end
	
end
