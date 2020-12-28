class AddEditedAtToComment < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :edited_at, :datetime, limit: 6
  end
end
