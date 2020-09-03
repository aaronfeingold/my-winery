module SessionsHelper
  def login_user(user_id)
    session[:user_id] = user_id
  end

  def redirect_if_logged_in
    redirect_to root_path and return if session[:user_id]
  end
end