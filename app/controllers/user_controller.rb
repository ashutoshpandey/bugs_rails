class UserController < ActionController.Base

    before_filter :initialize

    def initialize
        @root = '/'
    end

    def userSection()

        userId = session[:userId]
        if !userId
            redirect_to '/'
        end

        @runningProjects = Project.where('status = ?', 'active').count
        @closedProjects = Project.where('status = ?', 'closed').count
        @currentBugs = Bug.where('status = ?', 'active').count
        @fixedBugs = Bug.where('status = ?', 'fixed').count
        @unresolvedBugs = Bug.where('status = ?', 'unresolved').count

        @userBugs = BugUser.where('user_id = ? and status = ?', userId, 'active')
    end

    def createUser()

        userId = session[:userId]
        if !userId
            redirect_to '/'
        end
    end

    def saveUser()

        userId = session[:userId]
        if !userId
            render :json => {:message => 'not logged'}
        end

        email = params[:email]

        user = User.where('email = ?', email).first

        if user
            render :json => {:message => 'Duplicate email'}
        else
            user = User.new

            user.email = email
            user.name = params[:name]
            user.password = params[:password]
            user.user_type = params[:user_type]
            user.status = 'active'

            user.save()

            render :json => {:message => 'User created successfully'}
        end
    end

    def profile()

        userId = session[:userId]
        if !userId
            redirect_to '/'
        end

        userId = Session.get('userId')

        if userId
            @user = User.find(userId)

            if user

            else
                redirect_to '/'
            end
        else
            redirect_to '/'
        end
    end

    def updateProfile()

        userId = session[:userId]
        if !userId
            render :json => {:message => 'not logged'}
        end

        user = User.find(userId)

        if user
            email = params[:email]

            userByEmail = User.where('email = ?', email).first

            if userByEmail and userByEmail.id != user.id
                render :json => {:message => 'Email already taken'}
            else
                user.id = userId
                user.email = email
                user.name = params[:name]
                user.password = params[:password]
                user.user_type = params[:user_type]

                user.save()

                render :json => {:message => 'Profile updated successfully'}
            end
        else
            render :json => {:message => 'Invalid user'}
        end
    end

    def editUser(userId)

        if !userId
            redirect_to '/'
        end

        if userId
            @user = User.find(userId)

            session[:current_edit_user] = userId

            if user

            else
                redirect_to '/'
            end
        else
            redirect_to '/'
        end
    end

    def updateUser()

        userId = session[:current_edit_user]
        if !userId
            render :json => {:message => 'invalid'}
        end

        user = User.find(userId)

        if user
            user.name = params[:name]
            user.password = params[:password]
            user.user_type = params[:user_type]

            user.save()

            render :json => {:message => 'Profile updated successfully'}
        
        else
            render :json => {:message => 'Invalid user'}
        end
    end

    def listUsers()

        userId = session[:userId]
        if !userId
            render :json => {:message => 'not logged'}
        end
    end

    def removeUser(userId)

        if userId

            user = User.find(userId)

            if user
                user.status = 'removed'

                user.save()

                render :json => {:message => 'done'}
            else
                render :json => {:message => 'invalid'}
            end
        
        else
            render :json => {:message => 'invalid'}
        end
    end
    #************** json methods ***************/

    def dataListUsers()

        userId = session[:userId]
        if !userId
            render :json => {:message => 'not logged'}
        end

        users = User.where('status = ?', 'active').get()

        if users
            render :json => {:found => true, :users => users, :message => 'logged'}
        else
            render :json => {:found => true, :message => 'logged'}
        end
    end
end
