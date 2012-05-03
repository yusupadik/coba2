class CreateCategoriesProducts < ActiveRecord::Migration
  def change
    create_table :categories_products do |t|
      t.string :category_id
      t.string :product_id
      t.timestamps
    end
  end
end
