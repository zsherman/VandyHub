class CommentsController < ApplicationController

	def new
		@comment = Comment.new(:parent_id => params[:parent_id])
		@post = Post.find(params[:post_id])
		@parent_comment = Comment.find_by_id(params[:parent_id])
	end

	def create
		@comment = Comment.new(params[:comment])
	    @comment.user = current_user
	    @comment.post = Post.find(params[:post_id])
	    if @comment.save
	      redirect_to @comment.post
	    else
	      flash[:message] = "Sorry, your comment could not be saved"
	      redirect_to @comment.post
	    end
	end

	def edit
		@comment = Comment.find(params[:id])
		@post = Post.find(params[:post_id])
	end

	def update
		@comment = Comment.find(params[:id])
		if @comment.update_attributes(params[:comment])
      		redirect_to @comment.post, :flash => { :notice => "Comment updated." }
    	else
      		render 'edit'
    	end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@post = Post.find(params[:post_id])
	  	@comment.destroy
	  	redirect_to @post, :flash => { :notice => "Comment deleted." }
	end

end
