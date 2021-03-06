# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up

  def index
  end

  def new_sns

  end
  def new
    @user = User.new
  end

  # POST /resource
  def create
    if params[:sns_auth] == 'true'
      pass = Devise.friendly_token
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
    end
    # super
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @telephone = @user.telephones.build
    render :new_telephone
  end

  def create_telephone
    @user = User.new(session["devise.regist_data"]["user"])
    @telephone = Telephone.new(telephone_params)
    unless @telephone.valid?
      flash.now[:alert] = @telephone.errors.full_messages
      render :new_telephone and return
    end
    session["devise.regist_data"]["telephone"] = @telephone.attributes
    @address = @user.addresses.build
    render :new_address
  end

  def create_address
    @user = User.new(session["devise.regist_data"]["user"])
    @telephone = Telephone.new(session["devise.regist_data"]["telephone"])
    @address = Address.new(address_params)
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :new_address and return
    end
    @user.telephones.build(@telephone.attributes)
    @user.addresses.build(@address.attributes)
    @user.save
    sign_in(:user, @user)
  end

  def destroy
    
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end



  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end


  def telephone_params
    params.require(:telephone).permit(:phone_number, :user_id)
  end

  def address_params
    params.require(:address).permit(:post_number, :prefecture_id, :city, :town, :building)
  end
  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
