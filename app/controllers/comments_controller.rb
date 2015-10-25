class CommentsController < ApplicationController
    
    def create
        respond_to do |format|
            format.js {
                ###
               # @comment = Comment.new()
               # message = params[:message]
                #message = message["body"]
               # hidden = params[:comment]
               # @comment.message = message
                #@comment.date = hidden["date"]
               # @comment.user_id = hidden["user_id"]
               # @comment.toilet_id = hidden["toilet_id"]
                
                #@comment.save
               ###
                @comment = Comment.new();
                @comment.message = params[:message]
                @comment.user_id = params[:user_id]
                @comment.toilet_id = params[:toilet_id]
                @comment.date = params[:date]
                @comment.save
                
                @returnJson = {
                    :message => @comment.message,
                    :user_id => @comment.user_id,
                    :username => User.find(@comment.user_id).name,
                    :toilet_id => @comment.toilet_id,
                    :date => @comment.date
                }
                
				render json:  @returnJson
            }
        end
    end
    
    def edit
      
    end
end
