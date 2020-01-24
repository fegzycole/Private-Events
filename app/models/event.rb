class Event < ApplicationRecord
  scope :upcoming_scope, -> { where("date >= ?", DateTime.now.to_date) }
  scope :previous_scope, -> { where("date < ?", DateTime.now.to_date) }
  validates :location, presence: true, length: { in: 6..50 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :date, presence: true
  belongs_to :creator, class_name: 'User'
  has_many :event_attendees, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendees, source: :attendee

  def Event.upcoming
    Event.upcoming_scope
  end

  def Event.previous
    Event.previous_scope
  end
end
