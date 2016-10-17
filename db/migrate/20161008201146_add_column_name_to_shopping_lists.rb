class AddColumnNameToShoppingLists < ActiveRecord::Migration[5.0]
  def change
    add_column :shopping_lists, :name, :string
  end
end
