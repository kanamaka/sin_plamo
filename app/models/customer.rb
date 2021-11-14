class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  attachment :opus_images
  has_many :calendar, dependent: :destroy
  has_many :opus, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :questions
  has_many :favorites, dependent: :destroy
  has_many :favorited_opus, through: :favorites, source: :opu
end
