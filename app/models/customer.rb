class Customer < ActiveRecord::Base
  ACCOUNT_TYPES = %w(Free Basic Premium)

  # A customer has one log for every time they've called in. If the
  # customer is deleted, their logs are also deleted.
  # (Data retention? What's that?)
  has_many :logs, dependent: :destroy

  validates :account_type, inclusion: {in: ACCOUNT_TYPES}
  validates :name, length: {in: 1..255}
  validates :email, length: {in: 1..255}

  def number_of_calls
    logs.count
    # SQL: SELECT COUNT(*) FROM logs WHERE logs.customer_id = ?
  end

  def average_call_length
    logs.all.map(&:duration).sum / number_of_calls
    # SQL: SELECT * FROM logs WHERE logs.customer_id = ?
  end
end
