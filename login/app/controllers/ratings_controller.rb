class RatingsController < ApplicationController
	class RatingsController < ApplicationController
    #before_filter :authorize
    before_filter :get_parent

    def new
        @rating = @parent.ratings.build

    end

    # def create
    #     @comment = @post.ratings.build(params[:rating])
    #     if current_user.id == @post.id
    #         redirect_to post_path(@post), :alert => "You cannot rate for your own photo"
    #     else
    #         @rating = Rating.new(params[:rating])
    #         @rating.post_id = @post.id
    #         @rating.user_id = current_user.id
    #         if @rating.save
    #             respond_to do |format|
    #                 format.html { redirect_to post_path(@post), :notice => "Your rating has been saved" }
    #                 format.js
    #             end
    #         end
    #     end
    # end

    def update
            @post = Post.find_by_id(params[:post_id])
            if current_user.id == @post.id
                redirect_to post_path(@post), :alert => "You cannot rate for your own photo"
            else
                @rating = current_user.ratings.find_by_post_id(@post.id)
                if @rating.update_attributes(params[:rating])
                    respond_to do |format|
                        format.html { redirect_to post_path(@post), :notice => "Your rating has been updated" }
                        format.js
                    end
                end
            end
        end

    end

    def get_parent
        @parent = Post.find_by_id(params[:post_id])
        redirect_to posts_path 
    end

end
