class CreateGeneralShoppingLists < ActiveRecord::Migration[7.0]
  def change
    create_table :general_shopping_lists, &:timestamps
  end
end
