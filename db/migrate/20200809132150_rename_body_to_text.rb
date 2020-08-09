class RenameBodyToText < ActiveRecord::Migration[6.0]
  def change
    rename_column :gists, :body, :text
  end
end
