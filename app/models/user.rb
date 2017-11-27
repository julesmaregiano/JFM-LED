class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validates :phone, presence: :true
  validates :role, presence: :true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bookings
  has_many :availabilities

  enum role: [:particulier, :pro, :technician, :manager, :admin]
  after_initialize :init

  def init
    self.role  ||= 0
  end

end
