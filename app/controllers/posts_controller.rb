class PostsController < ApplicationController

  before_action :authenticate_user!

	def index
		@search = Post.search(params[:q])
		@posts = @search.result.includes(:category, :admin_user)
		@user = AdminUser.all
	end 
	
	def new
		@post = Post.new
		@category = Category.all
	end
	
	def create 
		@post = Post.new(post_params)
		if @post.save
			redirect_to posts_path, :notice =>"Your post has been submitted"
		else
		render "new"
		end
	end 
	
	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes!(post_params)
			redirect_to post_path, :notice =>"Your post has been updated"
		else
		render "edit"
		end
	
	end
	
	def show	
		
		@user = AdminUser.all
		@post = Post.find(params[:id])
		@comment = Comment.new(:post => @post)
		
		
	end
	
	def destroy
	
	@post = Post.find(params[:id])
	@post.destroy
	redirect_to posts_path
	end 
	
	private
	def post_params    
    params.require(:post).permit(:title, :body, :admin_user_id, :category_id)
	end
	
end
