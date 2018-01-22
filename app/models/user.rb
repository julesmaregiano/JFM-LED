class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :role, presence: true
  belongs_to :company
  belongs_to :branch

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bookings
  has_many :availabilities

  enum role: [:particulier, :pro, :technician, :manager, :admin]

  scope :working_after, -> (debut) { joins(:availabilities).where("date >= ?", debut)}
  scope :working_before, -> (fin) { joins(:availabilities).where("date <= ?", fin)}

  def self.working_this_week(date)
    self.working_after(date).working_before(date + 5).uniq
  end

end
