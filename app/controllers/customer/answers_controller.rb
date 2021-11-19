class Customer::AnswersController < ApplicationController
 def create
  @answer = Answer.new(answer_params)
  @answer.customer_id = current_customer.id
  @answer.question_id = params[:question_id]
  if @answer.save
   redirect_to questions_path
  else
   @question = Question.find(params[:question_id])
   render :show
  end
 end

 private
 def answer_params
  params.require(:answer).permit(:content)
 end

end
