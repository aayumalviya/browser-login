class UsersController < ApplicationController
  before_action :apply_validation, only: :update
  
    def index
      @current_user = current_user
    end

    def edit
      @user = User.find(params[:id])
    end
  
  def update
    @user = User.find(params[:id])
    if params[:user][:password].present?
      if @user.update(user_params)
        flash[:warning] = "Profile Updated Successfully"
        redirect_to root_path
      else
        render :edit
      end
    else
      render :edit
      flash[:danger] = "Fill the Password field"
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

  def error_msg
    user = User.find(params[:id])
  end


  def apply_validation
    if params[:user][:password].blank?
      flash[:danger] = "Password can't be blank"
    end
  end

  private 
  def user_params
    params.require(:user).permit(:full_name, :email, :user_name, :phone_number, :password, :otp, :image)
  end

end
