class IdentificationsController < ApplicationController

  def index
    @identity = Identifications.all
  end

  def new
    @identity = Identifications.new
    @identity.user << @users
  end

  def create
    @identity = Identifications.new(identifications_params)
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

private
  def identifications_params
    params.require(:identification).permit(:family_name_kanji, :first_name_kanji, :family_name_kana, :first_name_kana, :birthday).merge(user_id: current_user.id)
  end

end