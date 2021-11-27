class Customer::QuestionsController < ApplicationController
def index
 @questions = Question.all
end

def show
 @question = Question.find(params[:id])
 @answer = Answer.new
 @customer = current_customer
end

def new
 @question = Question.new
end

def create
 @question = Question.new(question_params)
 @question.customer_id = current_customer.id
  if @question.save
   redirect_to questions_path
  else
   render :new
  end
end
 def edit
  @question = Question.find(params[:id])
 end

 def update
  @question = Question.find(params[:id])
   if @question.update(question_params)
    redirect_to questions_path
   else
    redirect_to request.referer
   end
 end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path(@question.id)
  end

private
 def question_params
  params.require(:question).permit(:title, :content)
 end
end
