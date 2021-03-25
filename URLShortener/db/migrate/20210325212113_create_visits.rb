class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.integer :user_id, null: false
      t.integer :url_id, null:false
      t.integer :num_visits, default: 0
      t.timestamps
    end

    add_index :visits, :user_id
    add_index :visits, :url_id
  end
end
