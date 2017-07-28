class Reservation < ApplicationRecord
  validates_presence_of :event_friendly_id
  belongs_to :event
  belongs_to :user, :optional => true
end
