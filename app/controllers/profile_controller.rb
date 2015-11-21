class ProfileController < ApplicationController
  def show
    @user = User.find(params[:id])
    @created_recipes = @user.created_recipes
    @bookmarked_recipes = @user.bookmarked_recipes
    @liked_recipes = @user.liked_recipes
    @cooked_masterpieces = @user.cooked_masterpieces.includes(:recipe)
    @liked_masterpieces = @user.liked_masterpieces.includes(:recipe)
  end

  private
    # Use callbacks to share common setup or constraints between actions.


    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:id)
    end
end
