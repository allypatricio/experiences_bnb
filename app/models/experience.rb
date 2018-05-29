class Experience < ApplicationRecord

  CATEGORIES = ["Sports", "Food", "Culture", "Music", "Sightseeing"]

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :bookings

  validates :category, inclusion: { in: CATEGORIES }
  validates :address, :title, :description, :price, :duration, :category, presence: :true

  mount_uploader :photo, PhotoUploader

end
