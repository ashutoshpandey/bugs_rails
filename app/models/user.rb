class User < ActiveRecord::Base
    has_many :Bugs
    has_many :BugComments
    has_many :BugUsers
end