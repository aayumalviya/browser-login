class RegistrationsController < ApplicationController

    # def new
    #   @user = User.new(user_params)
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
          flash.now[:danger] = "User not created"
          render :new
        end
      end

      private 
      def user_params
         params.permit(:full_name, :email, :user_name, :phone_number, :password, :otp, :image)
      end
end
