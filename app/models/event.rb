class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  # deleting invitation breaks the link betn event and user and invitation is also destroyed from db so dependent destroy only on invitation
  has_many :invitations, foreign_key: "attended_event_id", dependent: :destroy
  has_many :attendees, through: :invitations

  scope :past, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date > ?', Date.today) }

  validates :title, :location, :date, presence: true
  validates :location, length: { in: 3..50 }
end
