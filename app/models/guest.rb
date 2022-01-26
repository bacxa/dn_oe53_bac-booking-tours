class Guest < ApplicationRecord
  belongs_to :booking
  validates :name, presence: true
  validates :dob, presence: true
end
