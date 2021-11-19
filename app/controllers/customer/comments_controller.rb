class Customer::CommentsController < ApplicationController
 layout 'customer/opus/show'

 def show
  @commenter = Opu.find(params[:id])
  @comments = @commenter.comments
  @comment = current_customer.comments.new
 end
 
 def create
  @comment = current_customer.comments.new(comment_params)
  if @comment.save
  redirect_back(fallback_location: root_path)
  else
  redirect_back(fallback_location: root_path)
  end
 end

  private
  def comment_params
    params.permit(:content)
  end
end
