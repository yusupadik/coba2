class ChangeColumnFromCountries < ActiveRecord::Migration
  def up
    change_column :countries, :code, :string
  end

  def down
    change_column :countries, :code, :integer
  end
end
