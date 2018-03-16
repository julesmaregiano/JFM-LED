class Booking < ApplicationRecord
  has_many :availabilities
  has_many :booked_product_options, dependent: :destroy
  has_many :users,         through: :availabilities
  has_many :option_values, through: :booked_product_options, dependent: :destroy
  delegate :branch, to: :user

  belongs_to :service_provider
  belongs_to :product
  belongs_to :user,    optional: true
  belongs_to :foreman, optional: true

  #validates :user_id,        presence: true
  #validates :availabilities, presence: true

  has_one :report,  dependent: :destroy
  has_one :address, dependent: :destroy, as: :addressable

  accepts_nested_attributes_for :address

  has_attachment :pdf

  include AlgoliaSearch
  algoliasearch do
    attribute :id, :reference, :user, :product
    attribute :created_at do
      created_at.strftime("%-d/%m/%Y")
    end
   # attribute :company do
   #   { company: user.try(:company).try(:name), logo: "http://res.cloudinary.com/zanzibar/image/upload/c_scale,w_65/#{user.company.photo.path}" }
   # end
    attribute :address do
      { address: address.address1, zipcode: address.zipcode, city: address.city }
    end
    attributesForFaceting [:user, :product]
  end

  after_create :add_report

  scope :of_the_day, -> { joins(:availabilities).where("date = ?", Date.current) }
  scope :for_this_branch, -> { joins(:availabilities).where("date = ?", Date.current) }
  scope :to_come, -> { joins(:availabilities).where("date > ?", Date.yesterday) }
  scope :soon, -> { joins(:availabilities).where("date < ?", Date.current + 7) }
  scope :status, -> (status) { joins(:availabilities).where("status = ?", status)}
  scope :branch, -> (branch) { joins(:user).where("branch_id = ?", branch.id) }


  def self.status_is(status)
    self.status(status).uniq
  end

  def self.for_next_week_for(user)
    bookings = self.to_come.soon.map do |booking|
      if booking.technicians.include?(user)
        booking
      end
    end
    bookings.uniq
  end

  def has_foreman
    Foreman.find(self.foreman_id)
  end

  def technicians
    self.availabilities.map do |availability|
      availability.user
    end.uniq
  end

  def tech_of_the_day
    self.availabilities.of_the_day.first.user
  end

  def add_report
    if self.report.nil?
      Report.create(booking: self)
    end
  end

end

# == Schema Information
# Schema version: 20180316124903
#
# Table name: bookings
#
#  address1                :string
#  address2                :string
#  address3                :string
#  address4                :string
#  bookable_id             :integer
#  bookable_type           :string
#  city                    :string
#  comment                 :text
#  company_id              :integer
#  confirmed_at            :datetime
#  country                 :string
#  created_at              :datetime         not null
#  foreman_id              :integer
#  id                      :integer          not null, primary key
#  latitude                :float
#  longitude               :float
#  product_id              :integer
#  reference               :string
#  send_confirmation_email :boolean          default("false")
#  service_provider_id     :integer
#  surface                 :string
#  updated_at              :datetime         not null
#  user_id                 :integer
#  zipcode                 :string
#
# Indexes
#
#  index_bookings_on_bookable_type_and_bookable_id  (bookable_type,bookable_id)
#  index_bookings_on_company_id                     (company_id)
#  index_bookings_on_foreman_id                     (foreman_id)
#  index_bookings_on_product_id                     (product_id)
#  index_bookings_on_service_provider_id            (service_provider_id)
#  index_bookings_on_user_id                        (user_id)
#
