class UsersController < ApplicationController

  before_filter :authenticate_admin

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'Pomyslnie utworzono uzytkownika'
      redirect_to user_path(@user)
    else
      flash[:alert] = 'Wystapil blad'
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = 'Aktualizacja przebiegla pomyslnie!'
      redirect_to user_path(@user)
    else
      flash[:alert] = 'Wystapil blad.'
      render :show
    end
  end

end