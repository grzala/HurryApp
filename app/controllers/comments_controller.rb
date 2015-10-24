class CommentsController < ApplicationController
    
    def create
        @comment = comment.new(comment_params)
        
        @comment.save
    end
end
