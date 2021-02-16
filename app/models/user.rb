class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_one_attached :avatar


  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :received_friend_requests, 
            class_name: 'FriendRequest', 
            foreign_key: :requestee_id,
            dependent: :destroy

  has_many :sent_friend_requests, 
            class_name: 'FriendRequest', 
            foreign_key: :requester_id,
            dependent: :destroy

  after_create :send_welcome_email

  devise :omniauthable, omniauth_providers: %i[facebook]
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end


 def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  
  end

end

