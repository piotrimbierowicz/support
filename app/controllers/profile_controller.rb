class ProfileController < ApplicationController

  def show
    @user = current_user
  end

  def update
    @user = current_user
    if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
      params[:user] = params[:user].except(:password)
      params[:user] = params[:user].except(:password_confirmation)
    end

    if @user.update_attributes(params[:user])
      sign_in @user, :bypass => true
      flash[:notice] = 'Konto zostalo zaktualizowane!'
      redirect_to profile_path
    else
      flash[:alert] = 'Wystapil blad.'
      render :show
    end
  end

end