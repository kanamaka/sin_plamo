class Question < ApplicationRecord
 has_many :answers, dependent: :destroy
 belongs_to :customer
 validates :title, presence: true, length: { maximum: 50 }, presence: { message: 'は１文字以上入力してください。' }
 validates :content,presence: true, length: { maximum: 3000 }, presence: { message: 'は１文字以上入力してください。' }
end
