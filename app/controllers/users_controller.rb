class UsersController < ApplicationController
	skip_before_filter :authorize, only:[:show,:index,:update,:destroy]


	def index
		@users = User.all
	end

	def new
  		@user = User.new 
	end

	def create
  		@user = User.new(params[:user])
  		 
  		if @user.save
    		session[:user_id] = @user.id
        	redirect_to posts_path, :notice => "Welcome to Confessions of Foodaholic! Please update your profile." 
        else 
        	redirect_to home_path, :notice => "The passwords don't match or your email is invalid."
        end
	end

 	def show
    	@user = User.find(params[:id])

	    respond_to do |format|
	      format.html # show.html.erb
	      format.json { render json: @user }
	    end
  	end

  	def index
    	authorize
    	@users = User.where(:user_type => "unconfirmed member").order("created_at desc")
  	end

  	def edit
    	authorize
    	@user = User.find(params[:id])
  	end

  	def report
	    authorize
	    if current_user
		    @user = User.find(params[:id])
	    	if current_user.id == @user.id
				redirect_to :back, :notice => "You cannot report yourself."		    		
	    	else
			    @user.isReported = 1;
			    @user.dateReported = Time.now
		    	@user.save
		    	redirect_to :back, :notice => "Successfully reported user"
		    end
	    end
  	end
  
  	def update
	    authorize
	    @user = User.find(params[:id])
	    respond_to do |format|
	      if @user.update_attributes(params[:user])
	        format.html { redirect_to user_path(@user), notice: 'Your profile was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
  	end

  	def destroy
	    authorize
	    @user = User.find(params[:id])
	    @user.destroy
	    
	    redirect_to users_path :notice=> "User has been deleted"
  	end 
end
