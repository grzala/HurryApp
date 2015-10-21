require 'csv'

module Helper_CSV
	def uploadCSV(filename)
		@column_names = [] 
		Toilet.columns.map {|c| @column_names.push(c.name) }
		
		csv_text = File.read("vendor/assets/toiletdbs/" + filename)
		csv = CSV.parse(csv_text, :headers => true)
		
		puts "CSV file uploaded, creating records"
		
		csv.each do |row|
		@r = row.to_hash
		@new_row = Hash.new
		@r.each do |key, value|
			if @column_names.include?(key.downcase)
			@new_row[key.downcase.to_sym] = value
				if value == "" || value.to_i == "0"
					@new_row[key.downcase.to_sym] = "Unknown"
				end
			end
		end
		@toilet = Toilet.new(@new_row)
		@toilet.save
		
	end
	
	puts "Database updated"
	
  end
  def uploadAllCSV #upload all
	Dir.new('vendor/assets/toiletdbs/').each do|file| 
		if(file && file != "." && file != "..")
			puts "Working on " + file
			uploadCSV(file)
		end
	end
  end
end
