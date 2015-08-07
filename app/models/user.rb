class User < ActiveRecord::Base
    has_many :bugs
    has_many :bugComments
    has_many :bugUsers
end