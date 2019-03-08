class UsersController < ApplicationController
skip_before_action :authorized, only: [:new, :create]


  def show
    # @user = User.find(params[:id])
    @user = User.find(params[:id])
  end

  def buddies
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to @user
    else
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name,
                                  :bio, :country, :handicap, :username, :password)
  end
end
