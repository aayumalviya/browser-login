class UsersController < ApplicationController
  
  def index
  end

  def new
    @user = User.new(params[:id])
  end

  def create 
    @user = User.new(user_params)
    @user.otp = SecureRandom.base64(2)
    if @user.save
      session[:user_id] = @user.id
      UserMailer.with(user: @user).welcome_email.deliver_now
      flash.now[:notice] = "User Created"
      redirect_to '/otp'
    else 
      flash.now[:notice] = "User not created"
      render :new
    end
  end

  private 
  def user_params
    params.require(:user).permit(:full_name, :email, :user_name, :phone_number, :password, :otp)
  end
  
end
