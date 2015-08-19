class CommentsController < ApplicationController
	def new
		@post = Post.find(params[:post_id])
		@comment = Comment.new
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		if @comment
			redirect_to @post
		else
			render 'new'
		end
	end

	private
		def comment_params
			params.require(:comment).permit(:body)
		end
end