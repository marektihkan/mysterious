class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false
      t.string :password_hash, null: false
      t.string :role, default: 'user'
      t.timestamp :created_at
      t.timestamp :updated_at
    end

    add_index :users, :email, unique: true
  end
end
