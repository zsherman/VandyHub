module PostsHelper

	def post_teaser(post)
  		output = h truncate(post.description, :length => 300, :omission => '...')
  		output += link_to('[more]', '/posts/' + post.id.to_s) if post.description.size > 200
  		output.html_safe
	end
end
