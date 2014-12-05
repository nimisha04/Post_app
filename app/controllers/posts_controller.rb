class PostsController < ApplicationController
	def new
		@post=Post.new
		if flash.empty?
			flash.now[:info]="Here you can create new posts"
		end
	end

	def create
		email=params[:post][:email]
		title=params[:post][:title]
		body=params[:post][:body]
		image=params[:post][:image]
		attachment=params[:post][:attachment]
		if params[:post][:image].present?
			image=params[:post][:image]
		else
			image="default.png"
		end
		@post=Post.new(email:email, title:title, body:body, image:image, attachment:attachment)
		if @post.save
			flash[:notice]="Post has been successfully created!"
			puts "created"
			PostMailer.notify_user(email).deliver
			redirect_to posts_path
		else
			flash[:danger]=@post.errors.full_messages.join(",")
			redirect_to posts_path
		end         
	end

	def index
		@post=Post.new
		@posts=Post.all.order('created_at DESC')
		# @comment=@post.comments.new
		# @comments=@post.comments.all
	end

	def show
		@post=Post.find_by(id:params[:id])
		@comment=@post.comments.new if @post.present?
		if @post
			# hflash.now[:info]="you can see your post here.."
		else
			redirect_to posts_path
		end
	end

	def destroy
		@post=Post.find_by(id: params[:id])
		if @post.destroy
			flash[:notice]="your post has been successfully deleted.."
			redirect_to posts_path
		else
			flash[:danger]=@post.errors.full_messages.join(",")
			redirect_to posts_path
		end
	end

	def edit
		@post=Post.find_by(id: params[:id])

		if @post
			flash.now[:info]="you can edit your post here.."
		else
			flash[:danger]=@post.errors.full_messages.join(",")
			redirect_to posts_path
		end
	end

	def update
		@post=Post.find_by(id: params[:id])
		if @post.update_attributes(email:params[:post][:email], title:params[:post][:title] , body:params[:post][:body], image:params[:post][:image], attachment:params[:post][:attachment])
			flash[:notice]="your post has been updated.."
			PostMailer.notify_user_on_update(params[:post][:email]).deliver
			redirect_to posts_path
		else

			flash[:danger]=@post.errors.full_messages.join(",")
			redirect_to posts_path
			
		end
	end

end
