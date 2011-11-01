class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.integer :old_id
      t.string :phone

      t.timestamps
    end

    add_index :clients, :old_id, :unique => true
  end
end
