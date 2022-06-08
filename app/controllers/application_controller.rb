# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :require_login

  private

  def current_user
    User.find_by_id(session[:user_id]) if logged_in?
  end

  def logged_in?
    !!session[:user_id]
  end

  def require_login
    unless session.include? :user_id
      redirect_to login_path,
                  { alert: 'You must be logged in access that page' }
    end
  end
end
