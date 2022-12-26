# frozen_string_literal: true

# User controller
class UsersController < ApplicationController
include UsersHelper
  before_action :no_autorize, only: %i[new create]
  before_action :autorize, only: %i[edit update]
  before_action :set_user, only: %i[edit update destroy]

  def index; end

  def show
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(new_all)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Добро пожаловать, #{@user.login}!"
      redirect_to form_path
    else
      redirect_to new_user_path, notice: 'Пароли не совпадают или данные логин или пароль существуют'
    end
  end

  def update
      if current_user.update new_all
      flash[:success] = 'Профиль обновлен'
      redirect_to edit_user_path(current_user)
      else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def new_all
    params.require(:user).permit(:email, :login, :password, :password_confirmation)
  end
    
end
