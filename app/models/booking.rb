class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :hideout

  validates :date_start, presence: true, comparison: { less_than: :date_end }
  validates :date_end, presence: true, comparison: { greater_than: :date_start }
  validates :status, presence: true
  validates :hideout, presence: true
  validates :user, presence: true


end
