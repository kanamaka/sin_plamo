class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  attachment :profile_image
  attachment :opus_images
  has_many :calendars, dependent: :destroy
  has_many :opus, dependent: :destroy
  has_many :comments
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_opus, through: :favorites, source: :opu
  has_many :friends, class_name: "Friend", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_friends, class_name: "Friend", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :friends, source: :followed
  has_many :followers, through: :reverse_of_friends, source: :follower
  # has_many :friends, dependent: :destroy
  # has_many :followings, through: :friends, source: :follower
  # has_many :passive_friends, class_name: 'Friends', foreign_key: 'follower_id', dependent: :destroy
  # has_many :followers, through: :passive_friends, source: :customer

  # def create_alarm_friend!(current_customer)
  #   temp = alarm.where(["customer_id = ? and customer_id = ? and action = ? ",current_customer.id, id, 'friend'])
  #   if temp.blank?
  #     alarm = current_customer.active_alarms.new(
  #       customer_id: id,
  #       action: 'follow'
  #     )
  #     alarm.save if alarm.valid?
  #   end
  # end

  def follow(customer_id)
   friends.create(followed_id: customer_id)
  end

  def unfollow(customer_id)
   friends.find_by(followed_id: customer_id).destroy
  end

  def following?(customer)
    followings.include?(customer)
  end
  #def create_notification_follow!(current_customer)
    #temp = Notification.where(["customer_id = ? and customer_id = ? and action = ? ",current_customer.id, id, 'follow'])
    #if temp.blank?
      #notification = current_customer.active_notifications.new(
      #visited_id: id,
      #action: 'follow'
      #)
      #notification.save if notification.valid?
    #end
  #end
end
