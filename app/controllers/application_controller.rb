class ApplicationController < ActionController::Base
    before_action :valid_user

    def current_user
        @_current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def valid_user
        if current_user.present?
            if current_user.otp_verified?
                # redirect_to '/'
            else
                if controller_name != 'sessions' && ['new', 'create'].exclude?(action_name)
                    redirect_to '/otp'
                end
            end
        elsif controller_name == 'sessions' && ['new', 'create'].include?(action_name)
        elsif controller_name == 'users' && ['new', 'create'].include?(action_name)
        else
            redirect_to '/login'
        end
    end
end
