class ShoppingList < ApplicationRecord
  belongs_to :user
  belongs_to :establishment

  has_many :product_shopping_lists, dependent: :destroy
end
