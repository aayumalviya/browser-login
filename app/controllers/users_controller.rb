class UsersController < ApplicationController
  
  def index
   @users = User.all
  end

  def new
    @user = User.new(params[:id])
  end

  def create 
    @user = User.new(user_params)
    if @user.save 
      flash[:notice]="Signup successful"
      redirect_to users_path
    else 
      flash[:notice]="Signup again"
      render :new
    end
  end

  private 
  def user_params
    params.require(:user).permit(:full_name, :email, :user_name, :phone_number, :password)
  end
  
end
