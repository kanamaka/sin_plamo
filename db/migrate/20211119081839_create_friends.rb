class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.references :customer
      t.references :follower, foreign_key: { to_table: :customers }
      t.timestamps
      t.index [:customer_id, :follower_id], unique: true
    end
  end
end
