class AuthenticationController < ActionController::Base

    def isValidUser()
        email = params[:email]
        password = params[:password]

        user = User.first :conditions => { :email => email, :password => password }

        if user
            session[:userId] = user.id
            session[:userType] = user.user_type
            session[:name] = user.name

            return "correct"
        else
            return "invalid"
        end
    end    
    

    def logout()
        reset_session

        redirect_to '/'
    end
end