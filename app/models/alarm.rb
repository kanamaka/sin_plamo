class Alarm < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :opu, optional: true
  belongs_to :comment, optional: true
  belongs_to :customer, class_name: 'Customer', foreign_key: 'customer_id', optional: true
  belongs_to :customer, class_name: 'Customer', foreign_key: 'customer_id', optional: true
end
