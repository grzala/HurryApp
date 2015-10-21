class Toilet < ActiveRecord::Base
    def is_valid?
        if (geox == nil && geoy == nil)
            return false
        end
        return true;
    end
end
