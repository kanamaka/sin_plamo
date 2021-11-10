class TagMap < ApplicationRecord
  belongs_to :opu
  belongs_to :tag
  validates :opu_id, presence: true
  validates :tag_id, presence: true
end
