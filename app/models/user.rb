class User < ActiveRecord::Base
  validates :uid, :presence => true
  validates :email, :presence => true
  validates :name, :presence => true
  validates :oauth_token, :presence => true
  validates :oauth_secret, :presence => true

  has_many :identities
  has_many :templates
  has_many :emails
  
  def self.create_with_omniauth(auth)
    create! do |user|
        user.uid = auth["uid"]
        user.email = auth["user_info"]["email"]
        user.name = auth["user_info"]["name"]
        user.oauth_token = auth["credentials"]["token"]
        user.oauth_secret = auth["credentials"]["secret"]
    end
  end
end
