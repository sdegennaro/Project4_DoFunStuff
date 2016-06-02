class Api::FavoritesController < ApplicationController

  def index
    render json: { fave: Favorite.all, user: current_user }

  end

  def create
    newFave = Favorite.create fave_params
    render json: { fave: newFave }

  end


  def destroy

  end

  private

  def fave_params
    params.require(:fave).permit(:event_id, :user_id)
  end

end
