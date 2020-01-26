# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @upcoming_events = @user.upcoming_events
    @previous_events = @user.previous_events
    @my_upcoming_events = @user.my_upcoming_events
    @my_previous_events = @user.my_previous_events
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
