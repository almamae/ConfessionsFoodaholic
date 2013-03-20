class PostsController < ApplicationController
	skip_before_filter :authorize, only: [:new, :create,:edit,:destroy, :approve]

	def index 
		 @post = Post.new
		 @posts = Post.search(params[:search]).order("created_at desc").paginate(:per_page => 5, :page => params[:page])
		 @featured = Post.find(:all, :order =>"like_counter desc", :limit => 5)		 
	end

	def show
		@post = Post.find(params[:id])
		@parent = @post
	end 

	def show_image
		@post = Post.find(params[:id])
		send_data @post.data, :type => 'image/png', :disposition => 'inline'
	end

	def new
		@post = Post.new		
	end

	def create
		authorize
		if params[:post]
			params[:post][:recipe_id] = params[:recipe_id]
			@post = Post.new(params[:post])
		end
		if @post.video_url != ""
			@post.content_type = "vid"
			@post.video_url = youtube_embed(params[:video_url])
		elsif !@post.file_type.nil?
			@post.content_type = "pic"
		else  
			@post.content_type = "blog"
		end

		if @post.save
			redirect_to :back, :notice => "Your post was saved"
		else 
			redirect_to home_url, :notice => "Error in submitting your post. Please fill-up all fields."
		end	
	end
	
	def edit
		authorize
		@post = Post.find(params[:id])
	end

	def about
		
	end

	def like
		@current_user = current_user
		@post = Post.find(params[:id])
		if current_user

			if @current_user.flagged?(@post, :like)
				@current_user.unflag(@post, :like)
				@post.decrement(:like_counter)
				@post.save	
			else
				@current_user.flag(@post, :like)
				@post.increment(:like_counter)
				@post.save
			end
			redirect_to post_path(@post)
		else 
			redirect_to post_path(@post), :notice => "Please log in."
		end
	end

	def approve
		isadmin
		@post = Post.find(params[:id]) 
		@post.isApproved = 1
		if @post.save	
			redirect_to unapproved_path, :notice =>"Your post has been approved"
		else
			redirect_to unapproved_path, :notice =>"Post not approved"
		end
	end
	
	def update
		authorize
		@post = Post.find(params[:id])
		
		if @post.update_attributes(params[:post])	
			redirect_to myposts_path, :notice =>"Your post has been updated"
		else
			render "edit"
		end
	end
	
	def destroy
		authorize
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to :back, :notice=> "Post was successfully deleted."
	end	

	def myposts
		authorize
		@posts = Post.where(:user_id => current_user.id).order("created_at desc").paginate(:per_page => 5, :page => params[:page]) 
	end

	def showcategory
		@post = Post.new		 
	 	@featured = Post.find(:all, :order =>"like_counter desc", :limit => 5)		 
		@posts = Post.where(:category => params[:category]).paginate(:per_page => 5, :page => params[:page])
	end	
end
