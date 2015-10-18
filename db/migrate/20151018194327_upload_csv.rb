require File.expand_path('lib/helper_csv.rb')

include Helper_CSV

class UploadCsv < ActiveRecord::Migration
  def change
     uploadCSV("York.csv")
     uploadCSV("Bolton.csv")
     uploadCSV("Scarborough.csv")
     uploadCSV("Leeds.csv")
  end
end
