class SearchController < ApplicationController

    def postByUser

        @post = Post.where(user_id: params[:user_id])

        render json: @post
        
      end

end
