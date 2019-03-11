class ShotsController < ApplicationController
  before_action :set_shot, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /shots
  def index
    @shots = Shot.all
  end

  # GET /shots/1
  def show
  end

  # GET /shots/new
  def new
    @shot = Shot.new
  end

  # GET /shots/1/edit
  def edit
  end

  # POST /shots
  def create
    @shot = Shot.new(shot_params)

    if @shot.save
      redirect_to @shot, notice: 'Shot was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /shots/1
  def update
    if @shot.update(shot_params)
      redirect_to @shot, notice: 'Shot was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /shots/1
  def destroy
    @shot.destroy
    redirect_to shots_url, notice: 'Shot was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shot
      @shot = Shot.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shot_params
      params.require(:shot).permit(:title, :description, :user_id)
    end
end
