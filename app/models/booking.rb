class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  has_many :guests, dependent: :destroy


  enum status: { waiting: 0, success: 1 }

  validates :est_start_date, presence: true
  validate :est_start_date_must_before_start_date
  validate :check_limit_guests

  accepts_nested_attributes_for :guests

  private

  def est_start_date_must_before_start_date
    return if start_date >= est_start_date

    errors.add(:est_start_date, "phải trước ngày bắt đầu")
  end

  def check_limit_guests
    if guests.size + tour.guests.count > tour.max_guest
      errors.add(:guests, "quá nhiều")
    end
  end
end
