class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save :downcase_email

  has_many :bookings, dependent: :destroy
  has_many :notifications, foreign_key: "to_user_id", dependent: :destroy

  validates :name, presence: true,
                   length: {maximum: Settings.user.length_name.max}
  validates :email, presence: true,
                    length: {maximum: Settings.user.length_email.max},
                    uniqueness: true

  validates :password, presence: true,
    length: {minimum: Settings.user.length_password.min}, allow_nil: true

  enum role: {user: 0, admin: 1}

  def downcase_email
    email.downcase!
  end

  def count_noti
    notifications.not_seen.count
  end

  def list_notification
    notifications.includes(:booking, :from_user).newest
  end
end
