class PasswordsController < ApplicationController
  def new
    # ResetPasswordMailer.with(user: @user).reset_password.deliver_now
  end

  def create
    @user = User.find_by(email: params[:email])
    ResetPasswordMailer.with(user: @user).reset_password.deliver_now
  end
end
