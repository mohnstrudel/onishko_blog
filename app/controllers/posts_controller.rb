class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :destroy]

  def index
    if params[:category].blank?
      @posts = Post.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @posts = Post.where(category_id: @category_id).order("created_at DESC")
    end 
  end

  def edit
  end

  def update
  	if @post.update_attributes(post_params)
      flash[:info] = "Post successfully updated!"
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
    flash[:success] = "Post successfully created!"
  	redirect_to posts_path
  end

  def destroy
  	
  	@post.delete
    flash[:danger] = "Post destroyed!"
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
