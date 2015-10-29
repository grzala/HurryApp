#by Mikolaj Panasiuk
class Comment < ActiveRecord::Base
    validates :toilet_id, :presence => true
    validates :user_id, :presence => true
    validates :message, :presence => true, length: {maximum: 300}
    validates :date, :presence => true
end
