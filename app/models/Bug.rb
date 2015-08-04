class Bug < ActiveRecord::Base
    has_many :BugFiles
    belongs_to :User
end