class CallbacksController < Devise::OmniauthCallbacksController

def github
    @user = User.from_omniauth(request.env["omniauth.auth"])
    signing_and_redirect @user
end
    
end