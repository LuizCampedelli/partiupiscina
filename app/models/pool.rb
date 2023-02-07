class Pool < ApplicationRecord
  belongs_to :user
  validates :name, :price, :size, :capacity, presence: true
  validates :price, :capacity, numericality: { only_integer: true }
  #validates :schedule, inclusion: [true, false]
end
