class RegistrationsController < ApplicationController
  before_action :apply_validation, only: :create
  
  
  # def new
  #   @user = User.new
  # end
  
  def create 
    @user = User.new user_params
    @user.otp = SecureRandom.alphanumeric(4)
    if @user.save
      session[:user_id] = @user.id
      UserMailer.with(user: @user).welcome_email.deliver_now
      flash[:success] = "User Created"
      redirect_to '/otp'
    else 
      render :new
    end
  end


  def apply_validation
    if params[:password].blank?
      flash.now[:danger] = "Password can't be blank"
    end
  end

  private 
  def user_params
      params.permit(:full_name, :email, :user_name, :phone_number, :password, :otp, :image)
  end

end
