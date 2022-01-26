class User < ApplicationRecord
  before_save{email.downcase!}

  has_many :bookings, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :name, presence: true,
                   length: {maximum: Settings.user.length_name.max}
  validates :email, presence: true,
                    length: {maximum: Settings.user.length_email.max},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: true

  has_secure_password
  validates :password, presence: true,
    length: {minimum: Settings.user.length_password.min}, allow_nil: true

  def self.digest string
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end

    BCrypt::Password.create(string, cost: cost)
  end

  enum role: {user: 0, admin: 1}

  private

  def password_validation?
    new_record? || password_digest_changed?
  end
end
