class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :shop, null: false
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps null: false
    end
    add_index :users, :shop, unique: true
  end

  def self.down
    drop_table :users
  end
end
