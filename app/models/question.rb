class Question < ApplicationRecord
 has_many :answers, dependent: :destroy
 belongs_to :customer
 validates :title, presence: true, length: { maximum: 50 }
 validates :content, length: { maximum: 3000 }
end
