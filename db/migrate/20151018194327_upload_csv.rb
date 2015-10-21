require File.expand_path('lib/helper_csv.rb')

include Helper_CSV

class UploadCsv < ActiveRecord::Migration
    def change
        uploadAllCSV
        
        puts "Double Entry Check..."
        @toilets = Toilet.all #check double entry and prevent no coordinates
        @toilets.each do |toilet|
            @toilets.each do |toilet2|
                if toilet != toilet2 && toilet.geox == toilet2.geox && toilet.geoy == toilet2.geoy
                    toilet2.destroy
                end
            end
            if toilet.geox == nil && toilet.geoy == nil
                toilet.destroy
            end
        end
    end
end
