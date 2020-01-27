# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper

  def log_in(user)
    cookies.permanent[:user_id] = user.id
    @currrent_user = user
  end

  def log_out
    cookies.delete(:user_id)
    @currrent_user = nil
  end
end
