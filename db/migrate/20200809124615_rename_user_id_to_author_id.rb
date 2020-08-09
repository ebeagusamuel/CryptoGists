class RenameUserIdToAuthorId < ActiveRecord::Migration[6.0]
  def change
    rename_column :gists, :user_id, :author_id
  end
end
