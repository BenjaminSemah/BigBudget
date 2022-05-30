class RenameNameToFirstNameInUsers < ActiveRecord::Migration[7.0]
  def up
    rename_column :users, :name, :first_name
  end

  def down
    rename_column :users, :first_name, :name
  end
end
