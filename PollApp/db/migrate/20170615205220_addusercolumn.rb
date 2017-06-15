class Addusercolumn < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_name, :string, null: false
    add_column :polls, :user_id, :integer, null: false
    add_column :polls, :title, :string, null: false
    add_column :questions, :question, :text, null: false
    add_column :questions, :poll_id, :integer, null: false
    add_column :answer_choices, :question_id, :integer, null: false
    add_column :answer_choices, :answer, :text, null: false
    # add_column :responses, :user_id, :integer, null: false
    # add_column :responses, :answer_choice_id, :integer, null: false

    add_index :users, :user_name, unique: true
    add_index :polls, :user_id
    add_index :questions, :poll_id
    add_index :answer_choices, :question_id
    # add_index :responses, [:user_id, :answer_choice_id]



  end
end
