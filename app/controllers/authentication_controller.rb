class AuthenticationController < ActionController::Base

    def isValidUser()
        email = params[:email]
        password = params[:password]

        user = User.find_by :email => email, :password => password

        if user
            session[:userId] = user.id
            session[:userType] = user.user_type
            session[:name] = user.name

            render :json => {'message' => 'correct'}
        else
            render :json => {'message' => 'invalid'}
        end
    end    
    

    def logout()
        reset_session

        redirect_to '/'
    end
end