class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :destroy]

  def index
  	@posts = Post.all
  end

  def edit
  end

  def update
  	if @post.update_attributes(post_params)
  		redirect_to @post
  	else
  		render 'edit'
  	end
  end

  def show
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.create(post_params)
  	redirect_to @post
  end

  def destroy
  	
  	@post.delete
  	redirect_to posts_path
  end

private
  def post_params
  	params.require(:post).permit(:title, :body, :category_id)
  end

  def find_post
  	@post = Post.find(params[:id])
  end
end
