class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :articles, dependent: :destroy
  before_save { self.email = email.downcase }

  def parse_time_zone
    time_zone.gsub(/\(GMT.*?\)\s/, '')
  end
  
end
