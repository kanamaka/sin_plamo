class Customer::QuestionsController < ApplicationController
def index
 @questions = Question.all
end

def show
 @question = Question.find(params[:id])
 @answer = Answer.new
end

def new
 @question = Question.new
end

def create
 @question = Question.new(question_params)
 @question.customer_id = current_customer.id
  if @question.save
   redirect_to question_path(current_customer)
  else
   render :new
  end
end

 def update
  @question = Question.find(params[:id])
   if @question.update(question_params)
    flash[:notice] = "編集しました"
    redirect_to　questions_path(@question.id)
   else
    render :new
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
