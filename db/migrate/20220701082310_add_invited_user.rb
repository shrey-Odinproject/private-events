class AddInvitedUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :invited, :text
  end
end
