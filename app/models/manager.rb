class Manager < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :service_provider
  has_many   :technicians, through: :service_provider

  validates :email, :first_name, :last_name,
    presence: true,
    length:   { maximum: 255 }

  validates :service_provider,
    presence: true
end

# == Schema Information
# Schema version: 20180313033516
#
# Table name: managers
#
#  created_at             :datetime         not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  id                     :integer          not null, primary key
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  service_provider_id    :integer
#  sign_in_count          :integer          default("0"), not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_managers_on_email                 (email) UNIQUE
#  index_managers_on_reset_password_token  (reset_password_token) UNIQUE
#  index_managers_on_service_provider_id   (service_provider_id)
#
