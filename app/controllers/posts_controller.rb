class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	def index
		@posts = Post.all.order('created_at desc').
				 	  paginate(page: params[:page], per_page: 3)
	end

	def show

	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new post_params

		if @post.save
			redirect_to @post, notice: "Perfect! Post was successfully saved!"
		else
			render 'new', notice: "What a disaster!"
		end
	end

	def edit

	end

	def update
		if @post.update post_params
			#Those commented lines updates slug when title is edited
			#@post.slug = post_params[:title].parameterize
			#@post.save!
			redirect_to @post, notice: 'You are my bicz!'
		else
			render 'edit', notice: 'What a disaster!'
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end

	private
		def post_params
			params.require(:post).permit(:title, :content, :slug)
		end

		def find_post
			@post = Post.friendly.find(params[:id])
		end
end
