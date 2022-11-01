class ApplicationController < ActionController::Base
    before_action :valid_user
    add_flash_types :info, :danger, :warning, :success

    def current_user
        @_current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def valid_user
        if current_user.present?
            if current_user.otp_verified?
                #  redirect_to users_path
            else
                if controller_name != 'sessions' && ['new', 'create'].exclude?(action_name)
                    redirect_to '/otp'
                end
            end
        elsif controller_name == 'sessions' && ['new', 'create'].include?(action_name)
        elsif controller_name == 'registrations' && ['new', 'create', 'edit', 'update'].include?(action_name)
        elsif controller_name == 'passwords' && ['new', 'create', 'edit', 'update'].include?(action_name)
        elsif controller_name == 'users' && ['edit_password', 'update_password'].include?(action_name)
        else
            redirect_to '/login'
        end
    end
end
