class Pool < ApplicationRecord
  belongs_to :user
  validates :name, :price, :size, presence: true
  validates :price, numericality: { only_integer: true }
  has_many_attached :photos
  #validates :photos, presence: true
  #validates :schedule, inclusion: [true, false]
end
