class MasterpiecesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_masterpiece, only: [:show, :edit, :update, :destroy, :like, :unlike]
  before_action :check_permission, only: [:edit, :update, :destroy]

  # GET /masterpieces
  # GET /masterpieces.json
  def index
    @masterpieces = Masterpiece.all
  end

  # GET /masterpieces/1
  # GET /masterpieces/1.json
  def show
  end

  # GET /masterpieces/new
  def new
    @masterpiece = Masterpiece.new
    @recipe_id = masterpiece_params[:recipe_id]
    @user_id = current_user.id if current_user
  end

  # GET /masterpieces/1/edit
  def edit
    @recipe_id = @masterpiece.recipe.id
    @user_id = @masterpiece.cook.id
  end

  # POST /masterpieces
  # POST /masterpieces.json
  def create
    @masterpiece = Masterpiece.new(masterpiece_params)

    respond_to do |format|
      if @masterpiece.save
        format.html { redirect_to @masterpiece, notice: 'Masterpiece was successfully created.' }
        format.json { render :show, status: :created, location: @masterpiece }
      else
        format.html { render :new }
        format.json { render json: @masterpiece.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /masterpieces/1
  # PATCH/PUT /masterpieces/1.json
  def update
    respond_to do |format|
      if @masterpiece.update(masterpiece_params)
        format.html { redirect_to @masterpiece, notice: 'Masterpiece was successfully updated.' }
        format.json { render :show, status: :ok, location: @masterpiece }
      else
        format.html { render :edit }
        format.json { render json: @masterpiece.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /masterpieces/1
  # DELETE /masterpieces/1.json
  def destroy
    @masterpiece.destroy
    respond_to do |format|
      format.html { redirect_to masterpieces_url, notice: 'Masterpiece was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    click_page = params[:click_page]
    notice = ""
    if @masterpiece.users_liking_it.include?(current_user)
      notice = "You've liked this masterpiece before."
    else
      @masterpiece.users_liking_it << [current_user]
      @masterpiece.save
    end
    respond_to do |format|
      if click_page == 'masterpiece_show'
        format.html { redirect_to @masterpiece, notice: "#{notice}" }
      end
    end
  end

 def unlike
    click_page = params[:click_page]
    notice = ""
    if @masterpiece.users_liking_it.include?(current_user)
      @masterpiece.users_liking_it.destroy(current_user)
      @masterpiece.save
      notice = "You've liked it before."
    else
      notice = "You haven't liked it yet."
    end
    respond_to do |format|
      if click_page == 'masterpiece_show'
        format.html { redirect_to @masterpiece, notice: "#{notice}" }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_masterpiece
      @masterpiece = Masterpiece.find(params[:id])
    end

    def check_permission
      raise SecurityTransgression unless current_user == @masterpiece.cook
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def masterpiece_params
      params.require(:masterpiece).permit(:recipe_id, :user_id, :description, :masterpiece_img)
    end
end
