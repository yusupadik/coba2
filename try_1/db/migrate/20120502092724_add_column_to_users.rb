class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :age, :string
    add_column :users, :birthday, :date
  end
end
