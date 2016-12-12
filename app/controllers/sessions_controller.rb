class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to users_url, notice: "Signed in successfully."
    else
      flash.now[:danger] = 'Invalid email/password'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_url
  end
end
