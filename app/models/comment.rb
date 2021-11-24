class Comment < ApplicationRecord
 belongs_to :customer
 belongs_to :opu
 has_many :alarm, dependent: :destroy
end
