class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.integer :old_id
      t.string :phone
      t.datetime :date_of_birth
      t.integer :weight
      t.integer :height
      t.string :referrer_name

      t.timestamps
    end

    add_index :clients, :old_id, :unique => true
  end
end
