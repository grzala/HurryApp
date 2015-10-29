#by Mikolaj Panasiuk
class Toilet < ActiveRecord::Base
    validates :geox, :presence => true;
    validates :geoy, :presence => true;
end
