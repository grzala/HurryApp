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
		
		@toilet_upvotes = @toilet.upvotes
		@toilet_downvotes = @toilet.downvotes
		@toilet_rating_progressbar = (@toilet_upvotes + @toilet_downvotes) / 100.to_f
		if @toilet_rating_progressbar == 0.00
			@toilet_rating_progressbar = 50
		else
			@toilet_rating_progressbar = @toilet_upvotes / @toilet_rating_progressbar
		end
		
		@comments = Comment.where(:toilet_id => @toilet.id)
		@comments = @comments.order(date: :desc)

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
	
	def new
		if !session[:user_id] || !User.find(session[:user_id]).admin
			redirect_to root_url
		end
		@toilet = Toilet.new
		@systems = {
			1 => "WGS84",
			2 => "OSGB36"
		}
	end
	
	def create
		if !User.find(session[:user_id]).admin
			redirect_to root_url
		else
		
		@params = params[:toilet]
		@toilet = Toilet.new
		@params.map do |key, value|
			@toilet[key] = value
			if key == :geox || key == :geoy
				@toilet[key] = value.to_f
			end
			if value == ""
				@toilet[key] = nil
			end
		end
		@toilet.save
		redirect_to toilet_path(@toilet)
		
		end
	end
	
	def delete
		if !session[:user_id] || !User.find(session[:user_id]).admin
			redirect_to root_url
		else
		
		@toilet = Toilet.find(params[:id])
		@votes = Vote.where(:toilet_id => @toilet.id)
		@comments = Comment.where(:toilet_id => @toilet.id)
		
		@votes.all do |vote|
			vote.destroy
		end
		
		@comments.all do |comment|
			comment.destroy
		end
		
		@toilet.destroy
		
		redirect_to root_url
		
		end
	end
end
