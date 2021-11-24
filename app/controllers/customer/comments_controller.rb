class Customer::CommentsController < ApplicationController

 def create
  @comment = current_customer.comments.new(comments_params.merge(opu_id: params[:opu_id]))
  @comment.save
  
  redirect_back(fallback_location: root_path)
 end

 def destroy
  @comment = Comment.find(params[:opu_id])
  @comment.destroy
  redirect_to request.referer
 end

  private
  def comments_params
    params.require(:comment).permit(:comment, :opu_id, :comment_id)
  end
end
