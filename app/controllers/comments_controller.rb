class CommentsController < ApplicationController
	def create
		
		body= params[:comment][:body]
		@post=Post.find_by(id:params[:post_id])
		@comment=@post.comments.new(body:body)
		respond_to do |format|
			if @comment.save
				format.html do
					flash[:notice]="successfully commented"
					if params[:comment][:from_page]=="index"
						PostMailer.notify_user_on_comment(@post.email).deliver
						redirect_to posts_path
					elsif params[:comment][:from_page]=="show"
						PostMailer.notify_user_on_comment(@post.email).deliver
						redirect_to post_path(@post)
					end
				end
				format.js do
					if params[:comment][:from_page]=="index"
						PostMailer.notify_user_on_comment(@post.email).deliver
						
					elsif params[:comment][:from_page]=="show"
						PostMailer.notify_user_on_comment(@post.email).deliver
					end

				end

			else
				format.html do 
					flash[:danger]=@comment.errors.full_messages.join(",")
					if params[:comment][:from_page]=="index"
						redirect_to posts_path
					elsif params[:comment][:from_page]=="show"
						redirect_to post_path(@post)
					end

				end
				format.js {render js: 'true'}
			end	
		end
	end

	def show
		@post=Post.find_by(id:params[:post_id])
		@comment=@post.comments.find_by(id:params[:id]) if @post.present?
		if @comment
			flash.now[:info]="you can see your comment here.."
		else
			flash[:danger]="comment not found...."
			redirect_to posts_path
		end
	end

	def edit
		@post=Post.find_by(id: params[:post_id])
		@comment=@post.comments.find_by(id:params[:id]) if @post.present?

		if @comment
			flash.now[:info]="you can edit your comment here.."
		else
			flash[:danger]=@comment.errors.full_messages.join(",")
			redirect_to posts_path
		end
	end

	def destroy
		@post=Post.find_by(id: params[:post_id])
		@comment=@post.comments.find_by(id:params[:id]) if @post.present?

		if @comment.destroy
			flash[:notice]="your comment has been successfully deleted.."
			redirect_to posts_path
		else
			flash[:danger]=@comment.errors.full_messages.join(",")
			redirect_to posts_path
		end
	end

	def update
		@post=Post.find_by(id: params[:post_id])
		@comment=@post.comments.find_by(id:params[:id]) if @post.present?
		if @comment.update_attributes(body:params[:comment][:body])
			flash[:notice]="your comment has been updated.."
			redirect_to posts_path
		else
			flash[:danger]=@comment.errors.full_messages.join(",")
			redirect_to posts_path
		end
	end
end
