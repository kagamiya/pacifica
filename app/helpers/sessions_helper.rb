module SessionsHelper

  # log in as the passed user
  def log_in(user) 
    session[:user_id] = user.id
  end

  # make an user session permanent
  def remember(user)
    user.remember_new_token
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # return the user associated with a cookie of remember token
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # return true when user is logged in
  def logged_in?
    !current_user.nil?
  end

  # discard a permanent session
  def forget(user)
    user.forget_token
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # log out current user
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
end
