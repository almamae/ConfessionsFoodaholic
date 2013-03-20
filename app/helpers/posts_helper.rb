module PostsHelper
	def toggle_like_button(post,user)
		
			if user && user.flagged?(post, :like)
				link_to "Unlike", like_post_path(post)
			else 
				link_to "Like", like_post_path(post)
			end
	end

	def like_counter(post)
		like_counter = post.flaggings.count
		if like_counter != 0
			if like_counter > 1
				 " (#{post.like_counter} likes)"
			else
				 " (#{post.like_counter} like)"
			end
		end		
	end

	def adminapprove(post)
		if current_user && current_user.user_type == "admin" && post.isApproved == 0
			 link_to "Approve", url_for(:controller => 'admin', :method => 'post', :action => 'approve', :id => post.id)
			# link_to "Delete", post, :confirm => "Are you sure?", :method => :delete
		end

		# if current_user && (current_user.user_type == "admin" || current_user.id == post.user_id) 
		# 	link_to "Delete", post, :confirm => "Are you sure?", :method => :delete
		# end
	end

	def deletepost(post)
		if current_user && (current_user.user_type == "admin" || current_user.id == post.user_id) 
			link_to "Delete", post, :confirm => "Are you sure?", :method => :delete
		end		
	end

	def report_user(post)
			link_to "Report user", url_for(:controller => 'users', :method=>'post',:action => 'report', :id => post.user_id) 
	end


end
