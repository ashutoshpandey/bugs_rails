class BugUser < ActiveRecord::Base
    belongs_to :Bug
    belongs_to :User
end
