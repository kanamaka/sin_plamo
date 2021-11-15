class Customer::CommentsController < ApplicationController
 def create
  @comment = current_customer.comments.new(comments_params)
   if @comment.save
    redirect_back(fallback_location: root_path)
   else
    redirect_back(fallback_location: root_path)
   end
 end

 def destroy
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect_to customer_path(params[:opus_id])
 end
private

  def comments_params
    params.permit(:comment)
  end
end
