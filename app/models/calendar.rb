class Calendar < ApplicationRecord
 belongs_to :customer, optional: true
 validates :title, presence: true, presence: { message: 'は１文字以上入力してください。' }
 validates :content, presence: true, presence: { message: 'は１文字以上入力してください。' }
 validates :parts, presence: true, presence: { message: 'は１文字以上入力してください。' }
end
