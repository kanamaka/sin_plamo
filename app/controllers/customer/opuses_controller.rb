class Customer::OpusesController < ApplicationController
 def show
  @opus = Opu.new
 end

 def index
  @opus = Opu.all
 end

 def create
 end

 def search
  @opus = Opus.search(params[:keyword])
  @keyword = params[:keyword]
  render "index"
 end

  private

  def opus_params
    params.require(:opus).permit(:opus_name, :image, :opus_explanation)
  end
end
