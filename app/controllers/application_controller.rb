class ApplicationController < ActionController::Base
  helper_method:current_user

  private def current_user
    User.find_by(id: session[:user]["id"]) if session[:user]["id"]
  end

  class LoginRequired < StandardError; end
  class Forbidden < StandardError; end

  private def login_required
      raise LoginRequired unless current_user
  end
end