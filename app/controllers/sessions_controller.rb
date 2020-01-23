class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])

    if user
      log_in user
      redirect_to user_path
    else
      flash.now[:notice] = 'Email does not exist'
      render 'new'
    end
  end
end
