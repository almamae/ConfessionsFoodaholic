class AdminController < ApplicationController
	def unapproved
		@posts = Post.where(:isApproved => 0).paginate(:per_page => 6, :page => params[:page]) 
	end

	def reported
		@users = User.where(:isReported => 1) 	
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
