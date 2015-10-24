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
		respond_to do |format|
			format.html { redirect_to(root_url) }
			format.json {
				@toilets = Toilet.all
				render json: {:toilets => @toilets}
			}
		end
	end
	
	def get_json_id
		@toilet = Toilet.find(params[:id])
		respond_to do |format|
			format.html { redirect_to(toilet_path(@toilet)) }
			format.json {
				render json: @toilet
			}
		end
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
		
		@comments = Comment.where(:toilet_id => @toilet.id)

	end
	
	def rate
		@toilet = Toilet.find(params[:id])
		respond_to do |format|
			format.html { redirect_to(toilet_path(@toilet)) }
			format.json {
				if !session[:user_id].nil?
					
					@votes = Vote.all
					@users_voted = []
					@votes.each do |vote|
						if vote.toilet_id == @toilet.id
							@users_voted << vote.user_id
						end	
					end
					if !@users_voted.include?(session[:user_id]) #has the user voted for this toilet?
						if params[:rate] == "up"
							@toilet.upvotes = @toilet.upvotes + 1
						elsif params[:rate] == "down"
							@toilet.downvotes = @toilet.downvotes + 1
						end
						@toilet.save
						@v = Vote.new(:toilet_id => @toilet.id, :user_id => session[:user_id])
						@v.save
					end
				end
				
				render json: @toilet
			}
		end
	end
end
