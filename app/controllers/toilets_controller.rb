class ToiletsController < ApplicationController
  def index
	@toilets = Toilet.all
  end
  def map
	@toilets = Toilet.all
	@coordinates = []
	
	@toilets.each do |toilet| 
		if(toilet.geox != nil && toilet.geoy != nil && toilet.geox != "" && toilet.geoy != "")
			@X = toilet.geox
			@Y = toilet.geoy
		
			@coordinates.push(Hash[:lat => @Y, :lng => @X, :ref => toilet.coordinatereferencesystem]) 
		end
	end
	
  end
end
