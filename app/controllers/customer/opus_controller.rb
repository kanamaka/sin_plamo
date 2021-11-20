class Customer::OpusController < ApplicationController
 def show
  @opera = Opu.find(params[:id])
  @customer = @opera.customer
  @commenter = Opu.find(params[:id])
  @comments = @commenter.comments
  @comment = current_customer.comments.new
 end

 def new
  @opus = Opu.new
 end

 def index
  @opera = Opu.find(Favorite.group(:opu_id).order('count(opu_id) desc').limit(3).pluck(:opu_id))
  @opera = Opu.all
  if params[:tag_ids]
   #[
   #  { id: 1, name: 'namae'},
   #  { id: 2, name: 'namae2'},
   #].pluck(:id)
   # => 1,2
   opera_ids = TagRelationship.where(tag_id: params[:tag_ids]).pluck(:opu_id)
   @opera = @opera.where(id: opera_ids)
  end
  @customer = current_customer
  @customers = Customer.find_by(params[:id])
  @tag = Tag.all
 end

 def create
  #画像作成ブロック
  @opus = Opu.new(opus_params)
  @opus.customer_id = current_customer.id
  @opus.save
  if params[:opu][:image].present?
   params[:opu][:image].shift
   params[:opu][:image].each do |image|
    opu_image = OpusImage.new()
    opu_image.image = image
    opu_image.opu_id = @opus.id
    if opu_image.valid?
     opu_image.save
    end
   end
  end
  #タグ作成ブロック
  @opu_tags = []
  tag_list = params[:opu][:tag_ids].split(',')
  tag_list.each do |tag|
   if Tag.exists?(name: tag) == false
    @tag = Tag.create(name: tag)
   else
    @tag = Tag.find_by(name: tag)
   end
   @opu_tags.push(@tag)
  end
  @opus.tags = @opu_tags
  #コメント機能
  #@comment = current_customer.opus.new(comments_params)
   #if @comment.save
    #redirect_back(fallback_location: root_path)
   #else
    #redirect_back(fallback_location: root_path)
   #end
  #end
  redirect_to customer_path(current_customer)
 end

 def edit
  @opu = Opu.find(params[:id])
 end

 def update
  @opu = Opu.find(params[:id])
  if @opu.update(opus_params)
    if params[:opu][:image].present?
      params[:opu][:image].shift
      params[:opu][:image].each do |image|
        opu_image = OpusImage.new()
        opu_image.image = image
        opu_image.opu_id = @opu.id
        if opu_image.valid?
          opu_image.save
        end
      end
    end
   redirect_to opus_path
  else
   render :edit
  end
 end

 def destroy
  @opus = Opu.find(params[:id])
  @opus.destroy
  redirect_to customer_path
 end

 def search
  @opus = Opu.search(params[:keyword])
  @keyword = params[:keyword]
  redirect_to opu_path
 end

  private

  def opus_params
    params.require(:opu).permit(:opus_name, :opus_explanation, :tag, opus_images_images: [])
  end

  def tags_params
    params.permit(:tag_ids)
  end

  def comments
    params.require(:comment).permit(:comments)
  end
end