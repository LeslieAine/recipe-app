class CreateGeneralShoppingLists < ActiveRecord::Migration[7.0]
  def change
    create_table :general_shopping_lists do |t|

      t.timestamps
    end
  end
end
