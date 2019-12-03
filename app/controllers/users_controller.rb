# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new; end

  def show
    @notice = params[:notice]
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to "/users/new"
    end
  end

private

  def user_params
    params.require(:user).permit(
      :name,
      :height,
      :happiness,
      :nausea,
      :tickets,
      :admin,
      :password
    )
  end
end
