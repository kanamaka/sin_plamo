class Opu < ApplicationRecord
 has_many :opus_images, dependent: :destroy
 accepts_attachments_for :opus_images, attachment: :image
 belongs_to :customer
 attachment :image
 has_many :favorites, dependent: :destroy
 has_many :favorited_customer, through: :favorites, source: :customer

  def favorited_by?(customer)
   favorites.where(customer_id: customer.id).exists?
  end
 def self.search(keyword)
  where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
 end
end
