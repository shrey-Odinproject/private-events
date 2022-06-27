class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :invitations, foreign_key: "attended_event_id"
  has_many :attendees, through: :invitations

  scope :past, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date > ?', Date.today) }

  # def self.past
  #   self.where('date < ?', Date.today)
  # end

  # def self.upcoming
  #   self.where('date > ?', Date.today)
  # end
end
