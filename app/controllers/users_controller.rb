class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    User.create(user_params)
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = @identity.user
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
    params.require(:deliver_address).permit(:postal_code, :prefecture, :city, :address1, :address2, :telephone).merge(user_id: current_user.id)
  end
end
