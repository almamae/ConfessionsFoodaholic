class AdminController < ApplicationController
	before_filter :authorize, :isadmin

	def unapproved
		@posts = Post.where(:isApproved => 0).paginate(:per_page => 6, :page => params[:page]) 
	end

	def reported
		@users = User.where(:isReported => 1) 
	end

	def approve
		if current_user
		    @post = Post.find(params[:id])
		    @post.isApproved = 1
	    	@post.save
	    	redirect_to :back
	    end
	end

	def make_admin
		if current_user
		    @user = User.find(params[:id])
		    @user.user_type = "admin"
	    	@user.save
	    	redirect_to users_path
	    end
	end

	def ban
		if current_user
		    @user = User.find(params[:id])
		    @user.isBanned = 1
	    	@user.save
	    	redirect_to :back, :notice=>"User banned."
    	end
	end

	def recent_approved
		@posts = Post.where(:isApproved => 1).paginate(:per_page => 6, :page => params[:page]) 
		
	end
end
