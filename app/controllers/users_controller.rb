class UsersController < ApplicationController

  include SessionsHelper
  before_action :authenticate!, only: [:profile]

  def new
    @user = User.new
  end

  def create
    user = User.create user_params
    redirect_to log_in_path
  end

  def log_in

  end

  def profile

    # debugger

    # this is now handled in a before_action so we dont need the code here
    # authenticate!
    @user = current_user
    # debugger

  end



  private

  def user_params
    params.require(:user).permit(:username,, :password, :password_confirmation)
  end

end
