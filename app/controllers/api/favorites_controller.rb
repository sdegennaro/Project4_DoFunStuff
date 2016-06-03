class Api::FavoritesController < ApplicationController

  include SessionsHelper

  def index
    render json: { faves: Favorite.all, user: current_user }

  end

  before_action :authenticate!

  def my_faves
    myFaves = Favorite.find_by user_id: current_user.id
    render json: { faves: myFaves }
  end
  
  def create
    newFave = Favorite.create fave_params
    render json: { fave: newFave }

  end


  def destroy

  end

  private

  def fave_params
    params.require(:favorite).permit(:event_id, :user_id)
  end

end
