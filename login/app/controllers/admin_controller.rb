class AdminController < ApplicationController
    before_filter :isadmin

	def adminpage
		
	end

	def unapproved
		@posts = Post.unapproved().paginate(:per_page => 6, :page => params[:page]) 
	end

	def reported
		@users = User.findreported() 	
	end

	def approve
		@post = Post.find(params[:id]) 
		@post.isApproved = 1
		if @post.save	
			redirect_to unapproved_path, :notice =>"Your post has been approved"
		else
			render "unapproved"
		end
	end
end