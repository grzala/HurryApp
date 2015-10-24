class Vote < ActiveRecord::Base
    has_many :userId
    has_many :toiletId
end
