class AdminController < ApplicationController
	def unapproved
		@posts = Post.where(:isApproved => 0).paginate(:per_page => 6, :page => params[:page]) 
	end

	def reported
		@users = User.where(:isReported => 1) 	
	end

	def approve
		if current_user
		    @post = Post.find(params[:id])
		    @post.isApproved = 1;
	    	@post.save
	    	redirect_to posts_path
	    end
	end

	def recent_approved
		@posts = Post.where(:isApproved => 1).paginate(:per_page => 6, :page => params[:page]) 
		
	end
end
