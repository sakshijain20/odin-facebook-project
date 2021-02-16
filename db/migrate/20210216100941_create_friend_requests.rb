class CreateFriendRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :friend_requests do |t|
      t.integer :requestee_id
      t.integer :requester_id

      t.timestamps
    end
  end
end
