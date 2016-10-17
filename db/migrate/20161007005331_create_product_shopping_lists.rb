class CreateProductShoppingLists < ActiveRecord::Migration[5.0]
  def change
    create_table :product_shopping_lists do |t|
      t.references :product, foreign_key: true
      t.references :shopping_list, foreign_key: true

      t.timestamps
    end
  end
end
