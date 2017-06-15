class CreatePolls < ActiveRecord::Migration[5.0]
  def change
    create_table :polls do |t|
      t.integer :user_id, null: false
      t.string :title
      t.timestamps
    end

    add_index :polls, :user_id
  end
end
