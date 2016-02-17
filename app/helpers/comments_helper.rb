module CommentsHelper
  def user_is_authorized_for_comment?(comment)
      current_user && (current_user == comment.user || current_user.admin?)
   end

   def comments_to_buttons(comments)
     raw comments.map { |c| link_to c.body, comment_path(id: c.id), class: 'btn-xs btn-primary'}
   end
 end
