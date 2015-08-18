class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)
		if @post.valid
			redirect_to @post
		else
			render 'new'
		end
	end

	private
	def post_params
		params.require(:post).permit(:title,:body,:user)
	end


end