# frozen_string_literal: true

class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if @user = User.find_by(name:params[:user][:name])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
