class ApplicationController < ActionController::Base
  include SessionsHelper

  def log_in(user)
    cookies.permanent[:user_id] = user.id
    @currrent_user = user
  end
end
