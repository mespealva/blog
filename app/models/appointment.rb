class Appointment < ApplicationRecord
  has_many :slot
  belongs_to :user
end
