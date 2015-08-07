class ProjectController < ActionController::Base

    layout "standard"

    before_filter :initFilter

    def initFilter
        @root = 'http://0.0.0.0:3000'
        @name = session[:name]
    end

    def createProject()

        userId = session[:userId]
        if !userId
            redirect_to '/'
        end
    end

    def saveProject()

        userId = session[:userId]
        if !userId
            render :json => {:message => 'not logged'}
        end    

        name = params[:name]
        project = Project.find_by :name => name, :status => 'active'

        if project
            render :json => {:message => 'duplicate'}
        else 
            project = Project.new

            project.name = name
            project.description = params[:description]
            project.status = 'active'
            project.created_by = session[:userId]

            project.save()

            render :json => {:message => 'done'}
        end
    end

    def edit()

        id = params[:id]

        userId = session[:userId]
        if !userId
            redirect_to '/'
        end

        @project = Project::find(id)

        session[:currentProjectId] = id
    end

    def update()

        userId = session[:userId]
        if !userId
            render :json => {:message => 'not logged'}
        end

        id = session[:currentProjectId]

        project = Project.find(id)

        if project

            name = params[:name]
            description = params[:description]
            status = params[:status]

            if name
                project.name = params[:name]
            end     

            if description
                project.description = params[:description]
            end

            if(isset(status))
                project.status = params[:status]
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

                #Bug::where('project_id', '=', id).update(array('status' => 'removed])

                render :json => {:message => 'done'}
            
            else
                render :json => {:message => 'invalid'}
            end
        
        else
            render :json => {:message => 'invalid'}
        end
    end

    def list()

        userId = session[:userId]
        if !userId
            redirect_to '/'
        end

        @projects = Project.where('status = ?','active')
    end

    #***************** json methods *****************/
    def dataListProjects()

        userId = session[:userId]
        if !userId
            render :json => {:message => 'not logged'}
        end

        projects = Project::where('status = ?', 'active')

        if projects and projects.count>0
            render :json => {:found => true, :projects => projects, :message => 'logged'}
        else
            render :json => {:found => false, :message => 'empty'}
        end
    end
end