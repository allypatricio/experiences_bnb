class Experience < ApplicationRecord

  CATEGORIES = ["Sports", "Food", "Culture", "Music", "Sightseeing"]

  belongs_to :user
  has_many :bookings

  validates :category, inclusion: { in: CATEGORIES }
  validates :address, :title, :description, :price, :duration, :category, presence: :true
end
