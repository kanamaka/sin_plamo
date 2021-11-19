class Friend < ApplicationRecord
 belongs_to :follower, class_name: 'Customer'
 belongs_to :customer
end
