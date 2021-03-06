class UsersController < ApplicationController
  before_action :admin_required, only: [:control]

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Welcome to the Movie Review App"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user.update(user_params)
      flash[:info] = "Your account has been saved"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def control
    @user = User.find_by(id: params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
