class SponsoredPostsController < ApplicationController

  def show
    @sponsored_posts = SponsoredPost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sponsored_post = SponsoredPost.new
  end

  def create
    @sponsored_post = SponsoredPost.new
    #@sponsored_post.title = params[:post][:title]
    #@sponsored_post.body = params[:post][:body]
    @topic = Topic.find(params[:topic_id])

    @sponsored_post.topic = @topic

    if @sponsored_post.save
      flash[:notice] = "Your Sponsored Post was saved successfully."
      redirect_to [@topic, @sponsored_post]
    else
      flash.now[alert] = "Error saving your Sponsored Post.  Please try again."
      render :new
    end
  end

  def edit
      @sponsored_post = SponsoredPost.find(params[:id])
  end

  def update
      @sponsored_post = SponsoredPost.find(params[:id])

      #@sponsored_post.title = params[:sponsored_posts][:title]
      #@sponsored_post.body = params[:sponsored_posts][:body]

      if @sponsored_post.save
        flash[:notice] = "Sponsored Post was updated"
        redirect_to [@sponsored_post.topic, @sponsored_post]

      else
        flash.now[:alert] = "Error updating Sponsored Post.  Please try again"
        render :edit
      end
    end
end
