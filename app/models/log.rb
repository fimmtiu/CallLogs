class Log < ActiveRecord::Base
  include ActionView::Helpers::DateHelper

  belongs_to :user
  belongs_to :customer

  validates :user, presence: true
  validates :customer, presence: true
  validates :summary, length: {minimum: 1}
  validates :duration, numericality: {greater_than: 0, only_integer: true}

  # Durations are stored in seconds. This converts the large number to a
  # human-readable string.
  def hms_duration
    sprintf "%d:%02d:%02d", (duration / 3600), duration % 3600 / 60, duration % 60
  end
end
