class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.date :due, null: true
      t.timestamp :completed_at, null: true
      t.references :user
      t.timestamps
    end

    add_index :tasks, :user_id
  end
end
