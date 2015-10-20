require File.expand_path('lib/helper_csv.rb')

include Helper_CSV

class UploadCsv < ActiveRecord::Migration
  def change
     uploadAllCSV
  end
end
