class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :bio, :name, :facebook_uid
  
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    user = User.find_by_email(data["email"])
    # Create an user with a stub password, if new. 
    user ||= User.create!(:email => data["email"], :password => Devise.friendly_token[0,20]) 
    user.update_attributes!({
      :bio => data['bio'],
      :name => data['name'],
      :facebook_uid => data['id']
    })
    user
  end 
  
  def facebook_photo_url
    "https://graph.facebook.com/#{facebook_uid}/picture" if facebook_uid
  end
end
