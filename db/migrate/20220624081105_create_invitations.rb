class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.integer :attendee_id
      t.integer :attended_event_id

      t.timestamps
    end
    add_foreign_key :invitations, :users, column: :attendee_id
    add_foreign_key :invitations, :events, column: :attended_event_id
  end
end
