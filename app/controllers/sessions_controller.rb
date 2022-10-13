class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(user_name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
        redirect_to '/'
    else
      flash[:notice]="Invalid Email or Password"
      redirect_to '/login'
    end
  end


  def otp
    # user = User.find_by(params[:user_name])
    if current_user.present? && current_user.otp_verified == true 
      redirect_to '/' 
    end 
  end

  def check_valid_otp
    user = User.find_by(id: session[:user_id])
    if params[:otp] == user.otp
      user.update(otp_verified: true)
      redirect_to users_path
    else
      redirect_to '/'
    end
  end

  def destroy
    session[:user_id] = nil
    flash.now[:notice] = "Logged Out"
    redirect_to '/login'
  end
end