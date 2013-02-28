module PostsHelper
	def toggle_like_button(post,user)
		if current_user
			if user.flagged?(post, :like)
				link_to "Unlike", like_post_path(post)
			else
				link_to "Like", like_post_path(post)
			end
		end
	end

	def like_counter(post)
		like_counter = post.flaggings.count
		if like_counter != 0
			if like_counter > 1
				 " (#{post.flaggings.count} likes)"
			else
				 " (#{post.flaggings.count} like)"
			end
		end		
	end
end
