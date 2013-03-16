class SessionsController < ApplicationController
	# def new
		
	# end

	def create
	  user = User.authenticate(params[:email], params[:password])
	  if user && user.isReported == 1
	  	redirect_to home_path, :notice => "You are banned from this site."
	  else
		  if user
		    session[:user_id] = user.id
		    redirect_to :back, :notice => "Logged in!"
		  else
		   # flash.now.alert = "Invalid email or password"
		    redirect_to :back, :notice => "Invalid email or password"
		   # render "home_path"
		  end
	   end
	end

	def destroy
		session[:user_id] = nil
  		redirect_to home_url, :notice => "Logged out!"	
	end
end
