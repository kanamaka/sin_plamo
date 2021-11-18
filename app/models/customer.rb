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
  
  has_many :friends
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :customer_id
  
  def follow(other_customer)
    unless self == other_customer
      self.relationships.find_or_create_by(follow_id: other_customer.id)
    end
  end
  
  def unfollow(other_customer)
   relationship = self.relationships.find_by(follow_id: other_customer.id)
   relationship.destroy if relationship
  end

  def following?(other_customer)
  end

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
