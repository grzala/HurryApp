require 'csv'

module ToiletsHelper
  def uploadCSV(filename)
    @column_names = [] 
	Toilet.columns.map {|c| @column_names.push(c.name.to_sym) }
	#1st is ID, omit it
	#length is 35
	@column_names.delete(@column_names[0])
	
	puts "column names converted to symbols"
	
	csv_text = File.read("vendor/assets/toiletdbs/" + filename)
	csv = CSV.parse(csv_text, :headers => true)
	
	puts "CSV file uploaded, creating classes"
	
	csv.each do |row|
	  @toilet = Toilet.new(
		@column_names[0] => row[0],
		@column_names[1] => row[1],
		@column_names[2] => row[2],
		@column_names[3] => row[3],
		@column_names[4] => row[4],
		@column_names[5] => row[5],
		@column_names[6] => row[6],
		@column_names[7] => row[7],
		@column_names[8] => row[8],
		@column_names[9] => row[9],
		@column_names[10] => row[10],
		@column_names[11] => row[11],
		@column_names[12] => row[12],
		@column_names[13] => row[13],
		@column_names[14] => row[14],
		@column_names[15] => row[15],
		@column_names[16] => row[16],
		@column_names[17] => row[17],
		@column_names[18] => row[18],
		@column_names[19] => row[19],
		@column_names[20] => row[20],
		@column_names[21] => row[21],
		@column_names[22] => row[22],
		@column_names[23] => row[23],
		@column_names[24] => row[24],
		@column_names[25] => row[25],
		@column_names[26] => row[26],
		@column_names[27] => row[27],
		@column_names[28] => row[28],
		@column_names[29] => row[29],
		@column_names[30] => row[30],
		@column_names[31] => row[31],
		@column_names[32] => row[32],
		@column_names[33] => row[33],
		@column_names[34] => row[34]
	  )
	  @toilet.save
	end
	
	puts "Database updated"
	
  end
end
