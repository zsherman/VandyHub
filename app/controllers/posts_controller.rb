class PostsController < ApplicationController
	respond_to :html, :xml, :json

	def index
		@posts = Post.paginate(:page => params[:page]).find_with_reputation(:votes, :all, order: "votes desc")
	end

	def show
		@post = Post.find(params[:id])
		@comments = @post.comments
		@comment = @post.comments.build
	end

	def new
		@post = Post.new
	end

	def create
	    @post = Post.new(params[:post])
	    @post.user = current_user
	    if @post.save
	      redirect_to posts_url
	    else
	      render :new
	    end
  	end

  	def destroy
    	@post = Post.find(params[:id])
    	@post.destroy
    	redirect_to posts_url
  	end

  	def upvote
  		@post = Post.find(params[:id])
  		@post.add_evaluation(:votes, 1, current_user)
  		respond_to do |format|
  			if @post.save
  				logger.info "it saved"
  				format.json { render :json => @post.reputation_for(:votes), :status => :ok }
  			else
  				format.json { render :json => @post.errors }
  			end
  		end

  	end

  	def newest
  		@posts = Post.find(:all, :order => "created_at DESC")
  	end

end
