class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

    if @post.save
      flash[notice] = "Post was saved."
      redirect_to @post

    else

      flash.now[:alert] = "There was an error saving the post.  Please try again."
    end
  end

  def show
    @post = Post.find(params[:id])
  end

end





  #def edit
  #end
