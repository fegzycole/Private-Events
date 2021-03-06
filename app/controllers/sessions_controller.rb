# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email])

    if user
      log_in user
      redirect_to user_path(user)
    else
      flash.now[:notice] = 'Email does not exist'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end
end
