class Tour < ApplicationRecord
  mount_uploader :images, ImagesUploader

  validates :name, presence: true
  enum sort: { regular: 0, enough_people: 1}
end
