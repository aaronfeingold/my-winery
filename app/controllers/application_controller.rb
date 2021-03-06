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
      redirect_to login_path,
        {alert: 'You must be logged in access that page'} unless
        session.include? :user_id
    end
end
