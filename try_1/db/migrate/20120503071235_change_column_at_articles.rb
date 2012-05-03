class ChangeColumnAtArticles < ActiveRecord::Migration
  def up
    change_column :articles, :rating, :integer
  end

  def down
    change_column :articles, :rating, :string
  end
end
