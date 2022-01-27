class Tour < ApplicationRecord
  mount_uploader :images, ImagesUploader

  has_many :bookings, dependent: :destroy
  has_many :guests, through: :bookings
  has_many :rates

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :images, presence: true
  validates :duration, presence: true
  validate :max_guest_should_be_greater_than_min_guest
  enum sort: { regular: 0, enough_people: 1}

  def remaining_tickets
    max_guest - guests.count
  end

  def rating
    rates.average('rating').to_f.round
  end

  private

  def max_guest_should_be_greater_than_min_guest
    errors.add("error")unless max_guest.to_f > min_guest.to_f
  end


end
