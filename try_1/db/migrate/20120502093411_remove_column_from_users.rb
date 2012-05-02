class RemoveColumnFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :bio_profile
  end

  def down
    add_column :users, :bio_profile, :string
  end
end
