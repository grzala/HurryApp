class CommentsController < ApplicationController
    
    def create
        @comment = Comment.new()
        message = params[:message]
        message = message["body"]
        hidden = params[:comment]
        @comment.message = message
        @comment.date = hidden["date"]
        @comment.user_id = hidden["user_id"]
        @comment.toilet_id = hidden["toilet_id"]
        
        @comment.save
        
        redirect_to toilet_path(hidden["toilet_id"])
    end
end
