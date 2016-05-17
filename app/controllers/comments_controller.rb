class CommentsController < ApplicationController

  before_action :require_sign_in
  before_action :authorize_user, only: [:destroy]



   def create

     @post = Post.find(params[:post_id])
     comment = @post.comments.new(comment_params)
     comment.user = current_user

     if comment.save
       flash[:notice] = "Comment saved successfully."
       redirect_to [@post.topic, @post]
     else
       redirect_to [@post.topic, @post]
        end
      end

      def create

        @topic = Topic.find(params[:post_id])
        comment = @topic.comments.new(comment_params)
        comment.user = current_user

        if comment.save
          flash[:notice] = "Comment saved successfully."
          redirect_to [@post.topic]
        else
          redirect_to [@post.topic]
        end
      end


      def destroy
        @post = Post.find(params[:post_id])
        comment = @post.find(params[:id])
        comment.user = current_user

        if comment.destroy
          flash[:notice] = "Comment was deleted."
          redirect_to [@post.topic, @post]
        else
          flash[:alert] = "Comment couldn't be deleted. Try again."
          redirect_to [@post.topic, @post]
        end
      end

    def destroy
      @comment = topic.find(params[:post_id])
      comment = @ctopic.find(params[:id])
      comment.user - current_user

     if comment.destroy
       flash[:notice] = "Comment was deleted."
       redirect_to [@post.topic, @post]
     else
       flash[:alert] = "Comment couldn't be deleted. Try again."
       redirect_to [@post.topic, @post]
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
       redirect_to [@comment.topic, @comment.post]
     end
   end

 end
