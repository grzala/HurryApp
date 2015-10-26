class CommentsController < ApplicationController
    
    def create
        respond_to do |format|
            format.js {
                @comment = Comment.new();
                @comment.message = params[:message]
                @comment.user_id = params[:user_id]
                @comment.toilet_id = params[:toilet_id]
                @comment.date = params[:date]
                @comment.save
                
                @returnJson = {
                    :id => @comment.id,
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
        @comment = Comment.find(params[:id])
        
        if session[:user_id] != @comment.user_id 
            #no permission
            redirect_to '/toilets/' + @comment.toilet_id.to_s
        end
        
    end
    
    def update
        @comment = params[:comment]
        @comment = Comment.find(@comment[:comment_id])
        @message = params[:message]
        @message = @message[:body]
        if session[:user_id] == @comment.user_id || User.find(session[:user_id]).admin == true
            # permission
            @comment.message = @message
            @comment.save
        end
        
        redirect_to '/toilets/' + @comment.toilet_id.to_s
    end
    
    def delete
        respond_to do |format|
            format.js {
                @comment = Comment.find(params[:id])
                if session[:user_id] == @comment.user_id || User.find(session[:user_id]).admin == true
                    @comment.destroy
                end
                render json: {:isDeleted => "is not needed"}
            }
        end
    end
end
