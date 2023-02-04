class Pool < ApplicationRecord
  belongs_to :user
  validates :name, :price, :size, presence: true
  validates :price, numericality: { only_integer: true }
  has_one_attached :photo
  #validates :schedule, inclusion: [true, false]
end
