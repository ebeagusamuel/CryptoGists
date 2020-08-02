class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :follower, index: true, foreign_key: true

      t.timestamps
    end
  end
end
