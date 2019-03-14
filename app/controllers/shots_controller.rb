class ShotsController < ApplicationController
  before_action :set_shot, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  impressionist actions: [:show]

  # GET /shots
  def index
    @shots = Shot.all.order("created_at DESC")
  end

  # GET /shots/1
  def show
   
  end

  # GET /shots/new
  def new
    @shot = current_user.shots.build
  end

  # GET /shots/1/edit
  def edit
  end

  # POST /shots
  def create
    @shot = current_user.shots.create(shot_params)


    respond_to do |format|
      if @shot.save
        format.html { redirect_to root_path, notice: 'shot was successfully created.' }
        format.json { render :show, status: :created, location: @shot }
      else
        format.html { render :new }
        format.json { render json: @shot.errors, status: :unprocessable_entity }
      end
    end
  end

    
  # PATCH/PUT /shots/1
  def update
    respond_to do |format|
    if @shot.update(shot_params)
      format.html { redirect_to @shot, notice: 'Shot was successfully updated.' }
      format.json { render :show, status: :ok, location: @shot }   
    else
      format.html { render :edit }
      format.json { render json: @shot.errors, status: :unprocessable_entity }
    end
  end
end
  # DELETE /shots/1
  def destroy
    @shot.destroy
    respond_to do |format|
    format.html { redirect_to shots_url, notice: 'Shot was successfully destroyed.' }
    format.json { head :no_content }
  end
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shot
      @shot = Shot.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shot_params
      params.require(:shot).permit(:title, :description, :user_id, :image)
    end
end
