class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def destroy
		Post.destroy(params[:id])
		# @post.destroy <--why not this?
		respond_to do |format|
			format.js do
				render nothing: true 
			end
			format.any do 
				redirect_to posts_path
			end
		end		
	end

	def new
		@post = Post.new
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params)

		if @post.valid?
			redirect_to @post
		else
			render 'edit'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.create(post_params)
		if @post.valid?
			redirect_to @post
		else
			render 'new'
		end
	end

	private
	def post_params
		params.require(:post).permit(:title,:body)
	end


end