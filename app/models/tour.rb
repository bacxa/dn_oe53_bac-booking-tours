class Tour < ApplicationRecord
  mount_uploader :images, ImagesUploader

  has_many :bookings, dependent: :destroy

  validates :name, presence: true, length: { maximum: Settings.tour.length_name.max }
  validates :description, presence: true
  validates :price, presence: true
  validates :images, presence: true
  validates :duration, presence: true

  enum sort: { regular: 0, enough_people: 1}
end
