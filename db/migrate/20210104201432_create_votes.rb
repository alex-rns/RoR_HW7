class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.references :author, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true
      t.integer :vote_value, default: 0
      t.timestamps
    end
  end
end
