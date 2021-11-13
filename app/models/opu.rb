class Opu < ApplicationRecord
 has_many :opus_images, dependent: :destroy
 accepts_attachments_for :opus_images, attachment: :image
 belongs_to :customer
 attachment :image
 has_many :comments
 def self.search(keyword)
  where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
 end
end
