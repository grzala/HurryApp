class ToiletsController < ApplicationController
  def index
	@toilets = Toilet.all
  end
  def map
	@toilets = Toilet.all
	@coordinates = []
	
	@toilets.each do |toilet| 
		@X = toilet.geox
		@Y = toilet.geoy
	
		@coordinates.push(Hash[:lat => @Y, :lng => @X, :ref => toilet.coordinatereferencesystem]) 
	end
	
  end
end
