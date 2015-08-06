class Bug < ActiveRecord::Base

    self.table_name = 'bugss'

    has_many :BugFiles
    belongs_to :User
end