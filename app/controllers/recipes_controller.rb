class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy, :like, :unlike, :bookmark, :unbookmark]
  before_action :check_permission, only: [:edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @ingredients = @recipe.ingredients
    @masterpieces = @recipe.masterpieces
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    3.times{@recipe.ingredients.build}
    @recipe.steps.build
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    # if params[:add_ingredient]
    #   @recipe.ingredients.build
    # end
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    click_page = params[:click_page]
    notice = ""
    if @recipe.users_liking_it.include?(current_user)
      notice = "You've liked this recipe before."
    else
      @recipe.users_liking_it << [current_user]
      @recipe.save
    end
    respond_to do |format|
      if click_page == 'recipe_show'
        format.html { redirect_to @recipe, notice: "#{notice}" }
      end
    end
  end

def unlike
    click_page = params[:click_page]
    notice = ""
    if @recipe.users_liking_it.include?(current_user)
      @recipe.users_liking_it.destroy(current_user)
      @recipe.save
      notice = "You've liked it before."
    else
      notice = "You haven't liked it yet."
    end
    respond_to do |format|
      if click_page == 'recipe_show'
        format.html { redirect_to @recipe, notice: "#{notice}" }
      end
    end
  end

  def bookmark  # saved
    click_page = params[:click_page]
    notice = ""
    if @recipe.users_saving_it.include?(current_user)
      notice = "You've saved it before."
    else
      @recipe.users_saving_it << [current_user]
      @recipe.save
    end
    respond_to do |format|
      if click_page == 'recipe_show'
        format.html { redirect_to @recipe, notice: "#{notice}" }
      end
    end
  end

   def unbookmark  # saved
    click_page = params[:click_page]
    notice = ""
    if @recipe.users_saving_it.include?(current_user)
      @recipe.users_saving_it.destroy(current_user)
      @recipe.save
      notice = "You've saved it before."
    else
      notice = "You haven't saved it yet."
    end
    respond_to do |format|
      if click_page == 'recipe_show'
        format.html { redirect_to @recipe, notice: "#{notice}" }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:user_id, :title, :description, :cook_time, :recipe_img,
                                      ingredients_attributes: [:id, :recipe_id, :name, :quantity, :_destroy],
                                      steps_attributes: [:id, :recipe_id, :step_number, :description, :step_img, :_destroy])
    end

    def check_permission
      raise SecurityTransgression unless current_user == @recipe.creator
    end
end
