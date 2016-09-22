class Log < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer

  validates :user, presence: true
  validates :customer, presence: true
  validates :notes, length: {minimum: 1}
  validates :duration, numericality: {greater_than: 0, only_integer: true}
end
