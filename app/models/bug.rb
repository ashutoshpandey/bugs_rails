class Bug < ActiveRecord::Base

    self.table_name = 'bugss'

    has_many :bugFiles
    belongs_to :user
end