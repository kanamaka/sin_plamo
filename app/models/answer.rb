class Answer < ApplicationRecord
  belongs_to :customer
  belongs_to :question
  validates :content, presence: true, length: { maximum: 1000 }
end
