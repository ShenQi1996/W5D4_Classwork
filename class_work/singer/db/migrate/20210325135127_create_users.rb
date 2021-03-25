class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      # define colums here
      t.string :username, null: false, unique: true      # unique true should not be here should be with add_index
      # unique: true is use to make no user in the same table have the same name
      t.timestamps # this will create the created_at and updated_at 
    end

    #add index for unique to work 
    #      table_name ,  colums name   
    add_index :users, :username
  end
end
