class UsersController < ApplicationController
  
    def index
      @current_user = current_user
    end

    def edit
      @user = User.find(params[:id])
    end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:warning] = "Profile Updated Successfully"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:info] = "#{@user.full_name} your account was deleted successfully"
    redirect_to '/signup'
  end

  def edit_password
    @user = User.find_by(id: params[:user_id])
  end

  def update_password
    user = User.find(params[:user_id])

    if user.update(password: params[:user][:password])
      flash[:warning] = "Password Updated Successfully"
      redirect_to '/login'
    else
      render :edit_password
    end
  end

  private 
  def user_params
    params.require(:user).permit(:full_name, :email, :user_name, :phone_number, :password, :otp, :image)
  end
end
