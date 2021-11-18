class Friend < ApplicationRecord
  belongs_to :customer
  belongs_to :follow, class_name: 'customer'
  validates :customer_id, presence: true
  validates :follow_id, presence: true
end
