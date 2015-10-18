class ToiletsController < ApplicationController
  def index
	@toilets = Toilet.all
  end
  def map
	@toilets = Toilet.all
	@coordinates = []
	
	@toilets.each do |toilet| 
		@X = toilet.geoX
		@Y = toilet.geoY
		
		if toilet.coordinateReferenceSystem.upcase == "OSGB36"
			
		end
	
		@coordinates.push(Hash[:lat => @Y, :lng => @X, :ref => toilet.coordinateReferenceSystem.upcase]) 
	end
	
  end
end
