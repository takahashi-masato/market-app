class IdentificationsController < ApplicationController

  def index
    @identity = Identifications.all
  end

  def new
    @identity = Identifications.new
    @identity.user << current_user
  end

  def create
    @identity = Identifications.new(identifications_params)
  end

  def edit
  end

  def updata
  end

private
  def identifications_params
    params.require(:identifications).permit(:nickname, user_id: [] )
  end

end