class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def calls
		last_post = Post.select("hourly_calls, total_calls").last
		render json: last_post
	end
end