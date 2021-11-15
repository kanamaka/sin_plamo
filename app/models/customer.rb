class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  attachment :opus_images
  has_many :calendars, dependent: :destroy
  has_many :opus, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_opus, through: :favorites, source: :opu
  has_many :active_notifications, class_name: "Notification", foreign_key: "customer_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "customer_id", dependent: :destroy
  def create_notification_follow!(current_customer)
    temp = Notification.where(["customer_id = ? and customer_id = ? and action = ? ",current_customer.id, id, 'follow'])
    if temp.blank?
      notification = current_customer.active_notifications.new(
      visited_id: id,
      action: 'follow'
      )
      notification.save if notification.valid?
    end
  end
end
