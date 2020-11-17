class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,  omniauth_providers: [:google_oauth2]

  def self.from_google(email:, full_name:, uid:, avatar_url:)
     create_with(uid: uid, full_name: full_name, avatar_url: avatar_url, password: Devise.friendly_token[0,20]).find_or_create_by!(email: email)
  end

  has_many :articles, dependent: :destroy
  before_save { self.email = email.downcase }

  def parse_time_zone
    time_zone.gsub(/\(GMT.*?\)\s/, '')
  end
  
end
