class Order < ApplicationRecord
  belongs_to :pool
  belongs_to :user
  validates :startdate, comparison: { greater_than: Date.today }
  validates :enddate, comparison: { greater_than: :startdate }
end
