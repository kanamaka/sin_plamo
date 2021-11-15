class Customer::CommentsController < ApplicationController
 def create
  @comment = current_customer.comments.new(comment_params)
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

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
