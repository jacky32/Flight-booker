class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings

  validates :name, :email, :password, :password_confirmation, presence: true

  def bookings_ordered_by_flight_date
    bookings.joins(:flight).order('flights.departure_datetime')
  end
end
