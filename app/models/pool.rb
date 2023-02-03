class Pool < ApplicationRecord
  belongs_to :user
  validates :name, :price, :size, presence: true
  validates :price, numericality: { only_integer: true }
  #validates :schedule, inclusion: [true, false]
end
