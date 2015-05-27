class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])

		@comment = @post.comments.create(comment_params)
		@comment.user_id = current_user.id
		if @comment.save

			redirect_to post_path(@post)
		else
			flash.now[:danger] = "error"
		end
	end

private

	def comment_params
		params.require(:comment).permit(:title, :body, :post_id, :user_id)
	end

end
