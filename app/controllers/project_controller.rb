class ProjectController < ActionController::Base

    before_filter :initialize

    def initialize
        @root = '/'
    end

    def createProject()

        userId = Session::get('userId')
        if !userId
            redirect_to '/'
        end
    end

    def saveProject()

        userId = Session::get('userId')
        if !userId
            render :json => {:message => 'not logged'}
        end    

        name = Input::get('name')
        project = Project::where('name', '=', name).where('status', '=', 'active').first()

        if project
            render :json => {:message => 'duplicate'}
        else 
            project = new Project()

            project.name = name
            project.description = Input::get('description')
            project.status = 'active'
            project.created_by = Session::get('userId')

            project.save()

            render :json => {:message => 'done'}
        end
    end

    def editProject(id)

        userId = session[:userId]
        if !userId
            redirect_to '/'
        end

        @project = Project::find(id)

        session[:currentProjectId] = id
    end

    def updateProject()

        userId = session[:userId]
        if !userId
            render :json => {:message => 'not logged'}
        end

        id = session[:currentProjectId]

        project = Project.find(id)

        if project

            name = Input::get('name')
            description = Input::get('description')
            status = Input::get('status')

            if name
                project.name = Input::get('name')
            end     

            if description
                project.description = Input::get('description')
            end

            if(isset(status))
                project.status = Input::get('status')
            end

            project.save()

            render :json => {:message => 'done'}
        
        else
            render :json => {:message => 'invalid'}
        end
    end

    def removeProject(id)

        if id

            project = Project.find(id)

            if project
                project.status = 'removed'

                project.save()

                Bug::where('project_id', '=', id).update(array('status' => 'removed'))

                render :json => {:message => 'done'}
            
            else
                render :json => {:message => 'invalid'}
            end
        
        else
            render :json => {:message => 'invalid'}
        end
    end

    def listProjects()

        userId = Session::get('userId')
        if !userId
            redirect_to '/'
        end

        @projects = Project::where('status','=','active').get()
    end

    #***************** json methods *****************/
    def dataListProjects()

        userId = Session::get('userId')
        if !userId
            render :json => {:message => 'not logged'}
        end

        projects = Project::where('status','=','active').get()

        if projects and count(projects)>0
            render :json => {:found => true, :projects => projects, :message => 'logged'}
        else
            render :json => {:found => false}
        end
    end
end