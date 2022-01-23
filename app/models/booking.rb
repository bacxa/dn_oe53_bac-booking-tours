class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  has_many :guests, dependent: :destroy

  enum status: { waiting: 0, success: 1 }

  validates :est_start_date, presence: true
  accepts_nested_attributes_for :guests
end
