class PostsController < ApplicationController
	respond_to :html, :xml, :json
	before_filter :authenticate_user!, :only => [:new]

	def index
		@posts = Post.find_by_hotness.paginate(:page => params[:page], :per_page => 10)
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
	      redirect_to @post, :flash => { :notice => "Post created successfully." }
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
		@posts = Post.paginate(:page => params[:page]).find(:all, :order => "created_at DESC")
	end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to @post, :flash => { :notice => "Post updated." }
    else
      render 'edit'
    end
  end

end
