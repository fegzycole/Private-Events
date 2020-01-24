class User < ApplicationRecord
  has_many :created_events, foreign_key: :creator_id, class_name: 'Event'
  has_many :event_attendees, foreign_key: :attendee_id
  has_many :attended_events, through: :event_attendees, source: :attended_event

  def upcoming_events
    self.attended_events.where("date >= ?", DateTime.now.to_date)
  end

  def previous_events
    self.attended_events.where("date < ?", DateTime.now.to_date)
  end
  
  def User.get_users(user)
    scope :users_scope, -> { where("id != ?", user.id) }
    User.users_scope
  end
end
