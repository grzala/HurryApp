class ToiletsController < ApplicationController
	def index
		@toilets = Toilet.all
	end
	def map
		@toilets = Toilet.all
	end
	def closest
	end
	
	def get_json_all
		@toilets = Toilet.all
		render json: {:toilets => @toilets}
	end
	
	def get_json_id
		@toilet = Toilet.find(params[:id])
		render json: @toilet
	end
  
	def show
		@toilet = Toilet.find(params[:id])
		@information = {
			"City: " => @toilet.organisationlabel,
			"Location: " => @toilet.locationtext,
			"Street: " => @toilet.streetaddress,
			"Category: " => @toilet.category,
			"Baby Change: " => @toilet.babychange,
			"Charge: " => @toilet.chargeamount,
			"Hours: " => @toilet.openinghours,
			"Report Email: " => @toilet.reportemail,
			"Is RadayKey needed?: " => @toilet.radarkeyneeded
		}
		
		if(@toilet.geox != nil && @toilet.geoy != nil && @toilet.geox != "" && @toilet.geoy != "")
			@X = @toilet.geox
			@Y = @toilet.geoy
		
			@coordinates = (Hash[:lat => @Y, :lng => @X, :ref => @toilet.coordinatereferencesystem]) 
		end
	end
	
	def rate
		
		@toilet = Toilet.find(params[:id])
		if params[:rate] == "up"
			@toilet.rating = @toilet.rating + 1
		elsif params[:rate] == "down"
			@toilet.rating = @toilet.rating - 1
		end
		@toilet.save
		
		render json: @toilet
	end
end
