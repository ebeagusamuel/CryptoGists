class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :follower, index: true

      t.timestamps
    end
    add_foreign_key :followings, :users, column: :follower_id
  end
end
