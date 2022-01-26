class Tour < ApplicationRecord
  has_one_attached :avatar

  has_many :bookings, dependent: :destroy
  has_many :guests, through: :bookings

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :duration, presence: true
  validate :max_guest_should_be_greater_than_min_guest
  enum sort: {regular: 0, enough_people: 1}

  scope :newest, ->{order created_at: :desc}

  def remaining_tickets
    max_guest - guests.count
  end

  private

  def max_guest_should_be_greater_than_min_guest
    errors.add(t(".error_limit")) unless max_guest.to_f > min_guest.to_f
  end


end
