class Opu < ApplicationRecord
 has_many :opus_images, dependent: :destroy
 accepts_attachments_for :opus_images, attachment: :image
 belongs_to :customer
 attachment :image
 has_many :favorites, dependent: :destroy
 has_many :comments
 has_many :favorited_customer, through: :favorites, source: :customer
 validates :opus_name, presence: true, length: {in: 1..30 }, presence: { message: 'は１文字以上入力してください。' }
 validates :opus_explanation, presence: true, presence: { message: 'は１文字以上入力してください。' }
 # validates :opus_images_images, presence: true, presence: { message: '画像を一つ以上選択してください。' }
 has_many :alarm, dependent: :destroy
 has_many :tag_relationships, dependent: :destroy
 has_many :tags, through: :tag_relationships

 def favorited_by?(customer)
   favorites.where(customer_id: customer.id).exists?
 end
 def self.search(keyword)
  where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
 end

 def create_alarm_favorite!(current_customer)
  temp = alarm.where(["customer_id = ? and customer_id = ? and opu_id = ? and action = ? ", current_customer.id, customer_id, id, 'favorite'])
  if temp.blank?
  alarm = current_customer.active_alarms.new(
  opu_id: id,
  customer_id: customer_id,
  action: 'favorite'
    )
  if alarm.customer_id == alarm.customer_id
   alarm.checked = true
  end
   alarm.save if alarm.valid?
  end
 end

 def create_alarm_comment!(current_customer, comment_id)
   temp_ids = Comment.select(:customer_id).where(opu_id: id).where.not(customer_id: current_customer.id).distinct
   temp_ids.each do |temp_id|
   save_alarm_comment!(current_customer, comment_id, temp_id['customer_id'])
   end
   save_alarm_comment!(current_customer, comment_id, customer_id) if temp_ids.blank?
 end

 def save_alarm_comment!(current_customer, comment_id, customer_id)
   alarm = current_customer.active_alarm.new(
   opu_id: id,
   comment_id: comment_id,
   customer_id: customer_id,
   action: 'comment'
   )
  if alarm.customer_id == alarm.customer_id
     alarm.checked = true
  end
  alarm.save if alarm.valid?
 end

 def save_tags(saveopu_tags)
    saveopu_tags.each do |new_name|
    opu_tag = Tag.find_or_create_by(name: new_name)
    self.tags << opu_tag
    end
 end
end
