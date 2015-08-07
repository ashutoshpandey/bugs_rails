class BugController < ActionController::Base

    before_filter :initFilter

    layout "standard"

    def initFilter
        @root = 'http://0.0.0.0:3000'
        @name = session[:name]
    end

    def create()

        userId = session[:userId]
        if !userId
            redirect_to '/'
        end

        @projectId = session[:currentProject]

        if @projectId
            @users = User.where('status = ?', 'active')
        else
            redirect_to '/'
        end
    end

    def save()

        userId = session[:userId]
        if !userId
            render :json => {:message => 'not logged'}
        end

        bug = Bug.new

        bug.title = params[:title]
        bug.description = params[:description]
        bug.severity = params[:severity]
        bug.created_by = session[:userId]
        bug.project_id = session[:currentProject]
        bug.status = 'active'

        bug.save()

        files = params[:file]
        if files
            fileCount = files.count
        else
            fileCount = 0
        end

        users = params[:users]

        if users
            userCount = users.count
        else
            userCount = 0
        end

        if fileCount>0
            files.each do |file|

                time = Time.new
                savedFileName = time.strftime("%Y%m%d%H%M%S")

                filename = file.original_filename

                File.open(Rails.root.join('public', 'uploads', filename), 'wb') do |file|
                    file.write(file.read)
                end

                bugFile = BugFile.new

                bugFile.bug_id = bug.id
                bugFile.file_name = filename
                bugFile.saved_file_name = savedFileName
                bugFile.status = 'active'

                bugFile.save()
            end
        end

        if userCount>0

            users.each do |userId|
                bugUser = BugUser.new

                bugUser.bug_id = bug.id
                bugUser.user_id = userId
                bugUser.status = 'active'

                bugUser.save()
            end
        end

        render :json => {:message => 'done'}
    end

    def edit(id)

        userId = session[:userId]
        if(!isset(userId))
            redirect_to '/'
        end

        @bug = Bug.find(id)
    end

    def update()

        userId = session[:userId]
        if !userId
            render :json => {'message' => 'not logged'}
        end

        id = params[:id]

        bug = Bug.find(id)

        if bug

            title = params[:title]
            description = params[:description]
            status = params[:status]

            if title
                bug.title = params[:title]
            end

            if description
                bug.description = params[:description]
            end

            if status
                bug.status = status
            end

            bug.save()

            render :json => {'message' => 'done'}
        
        else
            render :json => {'message' => 'invalid'}
        end
    end

    def changeBugStatus()

        userId = session[:userId]
        if !userId
            render :json => {'message' => 'not logged'}
        end

        id = params[:id]

        bug = Bug::find(id)

        if bug

            status = params[:status]

            if status
                bug.status = status
                bug.save()

                render :json => {'message' => 'done'}
            
            else
                render :json => {'message' => 'invalid'}
            end
        
        else
            render :json => {'message' => 'invalid'}
        end
    end

    def list()

        projectId = params[:id]

        userId = session[:userId]
        if !userId
            redirect_to '/'
        end

        if projectId
            session[:currentProject]=projectId
        else
            redirect_to '/'
        end
    end

    def saveBugComment()

        userId = session[:userId]
        if !userId
            render :json => {'message' => 'not logged'}
            return
        end

        bugComment = new BugComment()

        bugComment.comment= params[:comment]
        bugComment.created_by = session[:userId]
        bugComment.bug_id = session[:currentBugId]
        bugComment.status = 'active'

        bugComment.save()

        files = param[:file]
        fileCount = count(files)

        if fileCount > 0
            files.each do |file|
                destinationPath = 'public/uploads'

                savedFileName = date('Ymdhis')

                filename = file.getClientOriginalName()
                file.move(destinationPath, savedFileName)

                bugCommentFile = new BugCommentFile()

                bugCommentFile.bug_comment_id = bugComment.id
                bugCommentFile.file_name = filename
                bugCommentFile.saved_file_name = savedFileName
                bugCommentFile.status = 'active'

                bugCommentFile.save()
            end
        end

        render :json => {'message' => 'done'}
    end

    def bugDetail()

        bugId = params[:bugId]

        userId = session[:userId]
        if !userId
            redirect_to '/'
        end

        if bugId

            projectId = session[:currentProject]

            if projectId

                @bug = Bug.find(bugId)
                @project = Project.find(projectId)

                if @bug and @project
                    session[:currentBugId] = bugId

                    @bugFiles = BugFile.where('bug_id = ?', bugId)

                else
                    redirect_to '/'
                end
            
            else
                redirect_to '/'
            end
        
        else
            redirect_to '/'
        end
    end

    def downloadBug(bugId)

        if bugId

            bug = Bug.find(bugId)

            if bug

                bugFiles = BugFile.where('bug_id = ?', bugId)

                if bugFiles

                    bugFiles.each do |bugFile|

                    end
                end
            end
        end
    end
        

    #****************** json methods ***********************/

    def dataListBugs

        userId = session[:userId]
        if !userId
            render :json => {'message' => 'not logged'}
        end

        projectId = session[:currentProject]

        bugType = params[:bug_type]

        if projectId
            bugs = Bug.where('project_id = ? and status = ?', projectId, bugType);

            if bugs and bugs.count >0
                render :json => {:found => true, :bugs => bugs, :message => 'found'}
            else
                render :json => {:found => false, :message => 'empty'}
            end
        
        else
            render :json => {:found => false, :message => 'invalid'}
        end
    end
    

    def dataListBugComments

        userId = session[:userId]
        if !userId
            return :json => {:message => 'not logged'}
        end

        bugId = session[:currentBugId]

        if bugId
            comments = BugComment.where('bug_id = ?', bugId)

            if comments and count(comments)>0
                render :json => {:found => true, :comments => comments, :message => 'logged'}
            else
                render :json => {:found => false, :message => 'empty'}
            end
        
        else
            render :json => {:found => false, :message => 'logged'}
        end
    end
end