class UsersController < ApplicationController
  include SessionsHelper

  before_action :authenticate_user!, :except => [:create, :new, :log_in]
  # before_action :authenticate!, only: [:find_faves, :find_friends, :favorites, :profile]

  def create
    user = User.create user_params
    redirect_to log_in_path
  end

  def new
    @user = User.new
  end

  def log_in

  end


  def index
  end

  def find_friends
    render json: { users: User.all }
  end

  def find_faves
    myFaves = Favorite.where user_id: current_user.id
    render json: { faves: myFaves }
    # render json: { faves: Favorite.all }
  end

  def favorites
    @myFaves = Favorite.where user_id: current_user.id
    @myFriends = Friendship.where user_id: current_user.id

  end

  def friends
    @myFriends = Friendship.where user_id: current_user.id
  end

  



  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
