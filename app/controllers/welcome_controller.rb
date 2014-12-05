class WelcomeController < ApplicationController

	def index
		@text="Hello User....!!!!!!"
	end

	def nimisha
	end

	def get_comments
		@post=Post.find_by(id:params[:post_id])
		@comments=@post.comments.pluck(:id)
		puts @comments
		# render js:@comments
		respond_to do |format|
			format.html
			# format.js{render "abc.js.erb"}
			format.json{render :json => @comments}
		end
	end


	def comments_body
		body=Array.new
		@post=Post.find_by(id:params[:post_id])
		# @post_body=@post.body
		# body << @post_body
		# raise @post_body.to_yaml
		@comments=@post.comments.pluck(:body)
		respond_to do |format|
			format.html
			format.json{render :json => @comments}
		end
	end	
end
