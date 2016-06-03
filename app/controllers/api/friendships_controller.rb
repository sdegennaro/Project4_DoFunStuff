class Api::FriendshipsController < ApplicationController

  include SessionsHelper

  def index
    render json: { faves: Friendship.all, user: current_user }

  end

  before_action :authenticate!

  def create
    newFriend = Friendship.create friend_params
    render json: { friend: newFriend }

  end


  def destroy

  end

  private

  def friend_params
    params.require(:friend).permit(:friend_id, :user_id)
  end

end
