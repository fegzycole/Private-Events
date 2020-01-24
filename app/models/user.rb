# frozen_string_literal: true

class User < ApplicationRecord
  has_many :created_events, foreign_key: :creator_id, class_name: 'Event'
  has_many :event_attendees, foreign_key: :attendee_id
  has_many :attended_events, through: :event_attendees, source: :attended_event

  validates :name, presence: true, length: { in: 3..20 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 244 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  def upcoming_events
    attended_events.where('date >= ?', DateTime.now.to_date)
  end

  def previous_events
    attended_events.where('date < ?', DateTime.now.to_date)
  end

  def self.get_users(user)
    scope :users_scope, -> { where('id != ?', user.id) }
    User.users_scope
  end
end
