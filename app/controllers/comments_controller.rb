class CommentsController < InheritedResources::Base

  before_action :authenticate_user!
 
  def create
  
	@comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
	@comment.rating = 1
  
  if @comment.save
  ;flash[:notice] = 'Successfully Submitted'
  redirect_to(@comment.post)
  else  
  ;flash[:notice] = "Error submitting: #{@comment.errors}"
    redirect_to(@comment.post)
  end  
    end  	

    def comment_params
      params.require(:comment).permit(:user_id, :body, :post_id, :rating)
    end
  end  
  