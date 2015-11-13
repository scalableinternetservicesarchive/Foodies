class ProfileController < ApplicationController
  before_filter :authenticate_user!
  def index
    @user = current_user
    @created_recipes = current_user.created_recipes
    @bookmarked_recipes = current_user.bookmarked_recipes
    @liked_recipes = current_user.liked_recipes
    @cooked_masterpieces = current_user.cooked_masterpieces
    @liked_masterpieces = current_user.liked_masterpieces
  end

  def show
    @user = User.find(params[:id])
    @created_recipes = @user.created_recipes
    @bookmarked_recipes = @user.bookmarked_recipes
    @liked_recipes = @user.liked_recipes
    @cooked_masterpieces = @user.cooked_masterpieces
    @liked_masterpieces = @user.liked_masterpieces
  end

  def new
  end

  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.


    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:id)
    end

end
