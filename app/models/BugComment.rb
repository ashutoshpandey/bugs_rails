class BugComment < ActiveRecord::Base
    has_many :BugCommentFiles
    belongs_to :user
end
