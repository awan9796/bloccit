class CommentsController < ApplicationController

  before_action :require_sign_in
  before_action :authorize_user, only: [:destroy]



  def create

    if params[:post_id]

      @post = Post.find(params[:post_id])
      comment = Comment.new(comment_params)
      comment.user = current_user
      @post.comments << comment


      if comment.save
        flash[:notice] = "Comment saved successfully."
        redirect_to [@post.topic, @post]
      else
        flash[:notice] = "Could not save comment.  Please try again."
        redirect_to [@post.topic, @post]
      end

    else

      @topic = Topic.find(params[:topic_id])
      comment = Comment.new(comment_params)
      comment.user = current_user
      @topic.comments << comment


      if comment.save
        flash[:notice] = "Comment saved successfully."
        redirect_to [@topic]
      else
        flash[:notice] = "Could not save comment.  Please try again."
        redirect_to [@topic]
      end
    end
  end


  def destroy

    if params[:post_id]

      @post = Post.find(params[:post_id])
      comment = @post.comments.find(params[:id])
      comment.user = current_user

      if comment.destroy
        flash[:notice] = "Comment was deleted."
        redirect_to [@post.topic, @post]
      else
        flash[:alert] = "Comment couldn't be deleted. Try again."
        redirect_to [@post.topic, @post]
      end

    else

      @topic = Topic.find(params[:topic_id])
      comment = @topic.comments.find(params[:id])
      comment.user = current_user

      if comment.destroy
        flash[:notice] = "Comment was deleted."
        redirect_to [@topic]
      else
        flash[:notice] = "Comment couldn't be deleted. Try again."
        redirect_to [@topic]
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def authorize_user
    comment = Comment.find(params[:id])
    unless current_user == comment.user || current_user.admin?
      flash[:alert] = "You do not have permission to delete a comment."
      redirect_to [@topic]
    end
  end

end
