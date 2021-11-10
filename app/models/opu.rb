class Opu < ApplicationRecord
 has_many :opus_images, dependent: :destroy
 accepts_attachments_for :opus_images, attachment: :image
 belongs_to :customer
 attachment :image
 has_many :tag_maps, dependent: :destroy
 has_many :tags, through: :tag_maps
 def self.search(keyword)
  where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
 end

 def save_tag(sent_tags)
  current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
  old_tags = current_tags - sent_tags
  new_tags = sent_tags - current_tags

  old_tags.each do |old|
   self.post_tags.delete OpuTag.find_by(tag_name: old)
  end

  new_tags.each do |new|
   new_opu_tag = OpuTag.find_or_create_by(tag_name: new)
   self.opu_tags << new_opu_tag
  end
 end
end
