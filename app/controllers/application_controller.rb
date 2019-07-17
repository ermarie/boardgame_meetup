class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def home
        if user_logged_in?
            redirect_to user_path(current_path)
        end
    end
end
