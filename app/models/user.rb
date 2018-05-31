class User < ApplicationRecord
  has_many :bookings
  has_many :experiences

  validates :first_name, :last_name, presence: :true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :photo, PhotoUploader
end
