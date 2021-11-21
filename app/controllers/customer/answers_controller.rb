class Customer::AnswersController < ApplicationController
 def create
  @answer = Answer.new(answer_params)
  @answer.customer_id = current_customer.id
  @answer.question_id = params[:question_id]
  if @answer.save
   redirect_to request.referer
  else
   @question = Question.find(params[:question_id])
   render :show
  end
 end

 def destroy
  @answer = Answer.find(params[:id])
  @answer.destroy
  redirect_to request.referer
 end

 private
 def answer_params
  params.require(:answer).permit(:content)
 end

end
