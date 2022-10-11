class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flight
  has_many :passengers, dependent: :destroy
  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :passengers
end
