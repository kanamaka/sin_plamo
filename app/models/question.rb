class Question < ApplicationRecord
 belongs_to :customer
 validates :title, presence: true, length: { maximum: 100 }
 validates :body, length: { maximum: 3000 }
end
