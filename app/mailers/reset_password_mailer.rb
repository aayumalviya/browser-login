class ResetPasswordMailer < ApplicationMailer

    def reset_password
        @user = params[:user]
        mail(to: @user.email, subject: 'Reset Password instruction')
    end
end
