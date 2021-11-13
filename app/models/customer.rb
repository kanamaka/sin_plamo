class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  attachment :opus_images
  has_many :calendar
  has_many :opus, dependent: :destroy
  has_many :comments, dependent: :destroy
end
