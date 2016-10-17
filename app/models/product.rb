class Product < ApplicationRecord
  belongs_to :establishment

  has_many :product_shopping_lists
end
