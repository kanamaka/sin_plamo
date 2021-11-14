class Customer::CommentsController < ApplicationController
 def create
  @comment = current_customer.post_comments.new(post_comment_params)
  @comment.opus_image_id = opus_image.id
  @comment.save
  redirect_to customer_path
 end

 def destroy
  Comment.find_by(id: params[:id]).destroy
  redirect_to customer_path(params[:opus_id])
 end
private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
