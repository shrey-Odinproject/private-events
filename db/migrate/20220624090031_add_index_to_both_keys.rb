class AddIndexToBothKeys < ActiveRecord::Migration[7.0]
  def change
    add_index :invitations, :attendee_id
    add_index :invitations, :attended_event_id
  end
end
