class Calendar < ApplicationRecord
 belongs_to :customer
 validates :title, presence: true
 validates :content, presence: true
 validates :start_time, presence: true
 validates :parts, presence: true
end
