class Experience < ApplicationRecord

  CATEGORIES = ["Sports", "Food", "Culture", "Music", "Sightseeing"]

  include PgSearch
  pg_search_scope :search_by_title_and_description,
    against: [ :title, :description ],
    using: {
      tsearch: { prefix: true }
    }

  scope :category, -> (category) { where category: category }
  scope :duration, -> (duration) { where duration: duration }
  scope :price,    -> (price)    { where price: price }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :bookings

  validates :category, inclusion: { in: CATEGORIES }
  validates :address, :title, :description, :price, :duration, :category, presence: :true

  mount_uploader :photo, PhotoUploader

end
