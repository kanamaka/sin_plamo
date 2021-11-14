class Customer::QuestionsController < ApplicationController
def index
 @question = Question.find_by(params[:id])
end

def show
 @question = Question.find_by(params[:id])
end

def new
 @questions = Question.find_by(params[:id])
 @question = Question.new
end

def create
 @question = Question.new(question_params)
 @question.customer_id = current_customer.id
  if @question.save
   flash[:notice] = "成功！"
   redirect_to("/questions/new")
  else
   flash.now[:alert] = "失敗！"
   render("questions/new")
  end
end

private
 def question_params
  params.require(:question).permit(:title, :body)
 end
end
