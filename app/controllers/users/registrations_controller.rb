# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  def new
    @user = User.new
  end
  # POST /resource
  # def create
  #   super
  # end
  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @identification = @user.build_identification
    render :new_identification
  end

  def create_identification
    @user = User.new(session["devise.regist_data"]["user"])
    @identification = Identification.new(identification_params)
    unless @identification.valid?
      flash.now[:alert] = @identification.errors.full_messages
      render :new_identification and return
    end
    @user.build_identification(@identification.attributes)
    session["identification"] = @identification.attributes
    @deliver_address = @user.build_deliver_address
    render :new_deliver_address

  end

  def create_deliver_address
    @user = User.new(session["devise.regist_data"]["user"])
    @identification = Identification.new(session["identification"])
    @deliver_address = DeliverAddress.new(deliver_address_params)
    unless @deliver_address.valid?
      flash.now[:alert] = @deliver_address.errors.full_messages
      render :new_deliver_address and return
    end
    @user.build_identification(@identification.attributes)
    @user.build_deliver_address(@deliver_address.attributes)
    @user.save
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
    render :create_identification
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def identification_params
    params.require(:identification).permit(:family_name_kanji, :first_name_kanji, :family_name_kana, :first_name_kana, :birthday)
  end

  def deliver_address_params
    params.require(:deliver_address).permit(:family_name_kanji, :first_name_kanji, :family_name_kana, :first_name_kana,:postal_code, :prefecture, :city, :address1, :address2, :telephone)
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys:[:nickname, :family_name_kanji, :first_name_kanji, :family_name_kana, :first_name_kana, :birthday,
                                                      :postal_code, :prefecture, :city, :address1, :address2, :telephone])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
    root_path
  end
end
