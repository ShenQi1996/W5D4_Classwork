class RemoveOldIndexAddNewIndexToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, :username
    add_index :users, :username, unique: true   #this is how we fix and add unique: true into our index 
  end
end
