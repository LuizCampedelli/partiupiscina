class Pool < ApplicationRecord
  belongs_to :user
  has_many :orders
  validates :name, :price, :size, :capacity, :address, presence: true
  validates :price, :capacity, numericality: { only_integer: true }
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  #validates :photos, presence: true
  #validates :schedule, inclusion: [true, false]
end
