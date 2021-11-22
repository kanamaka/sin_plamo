class Opu < ApplicationRecord
 has_many :opus_images, dependent: :destroy
 accepts_attachments_for :opus_images, attachment: :image
 belongs_to :customer
 attachment :image
 has_many :favorites, dependent: :destroy
 has_many :comments
 has_many :favorited_customer, through: :favorites, source: :customer
 validates :opus_name, presence: true, length: {in: 1..30 }
 validates :opus_explanation, presence: true
 validates :opus_images_images, presence: true
 has_many :notifications, dependent: :destroy
 has_many  :tag_relationships, dependent: :destroy
 has_many  :tags, through: :tag_relationships

 def favorited_by?(customer)
   favorites.where(customer_id: customer.id).exists?
 end
 def self.search(keyword)
  where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
 end

 def create_notification_comment!(current_customer, comment_id)
   temp_ids = Comment.select(:customer_id).where(opu_id: id).where.not(customer_id: current_customer.id).distinct
   temp_ids.each do |temp_id|
   save_notification_comment!(current_customer, comment_id, temp_id['customer_id'])
   end
   save_notification_comment!(current_customer, comment_id, customer_id) if temp_ids.blank?
 end

 def save_notification_comment!(current_customer, comment_id, customer_id)
   notification = current_customer.active_notifications.new(
   opu_id: id,
   comment_id: comment_id,
   customer_id: customer_id,
   action: 'comment'
   )
  if notification.customer_id == notification.customer_id
     notification.checked = true
  end
  notification.save if notification.valid?
 end

 def save_tags(saveopu_tags)
    saveopu_tags.each do |new_name|
    opu_tag = Tag.find_or_create_by(name: new_name)
    self.tags << opu_tag
    end
 end
end
