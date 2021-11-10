class Tag < ApplicationRecord
 has_many :tag_maps, dependent: :destroy
 has_many :opus, through: :tag_maps
end
