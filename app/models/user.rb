class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :phone,      presence: true
  validates :role,       presence: true

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

  def full_name
    [first_name, last_name].compact.join(' ')
  end

end

# == Schema Information
# Schema version: 20180312213904
#
# Table name: users
#
#  address                :string
#  branch_id              :integer
#  company_id             :integer
#  created_at             :datetime         not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  id                     :integer          not null, primary key
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  phone                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer
#  sign_in_count          :integer          default("0"), not null
#  signature              :binary
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_branch_id             (branch_id)
#  index_users_on_company_id            (company_id)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
