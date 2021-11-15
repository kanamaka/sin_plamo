class Customer::QuestionsController < ApplicationController
def index
 @questions = Question.find(id: params[:id])
end

def show
 @question = Question.find(params[:id])
end

def new
 @question = Question.new
end

def create
 @question = Question.new(question_params)
 @question.customer_id = current_customer.id
  if @question.save
   redirect_to questions_path(current_customer)
  else
   render :new
  end
end

private
 def question_params
  params.require(:question).permit(:title, :content)
 end
end
