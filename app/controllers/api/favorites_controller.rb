class Api::FavoritesController < ApplicationController

  include SessionsHelper

  def index
    render json: { faves: Favorite.all, user: current_user }

  end

  before_action :authenticate!

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
