class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def show
    @items = current_user.items
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.fetch(:user, {}).permit(:name)
  end
end
