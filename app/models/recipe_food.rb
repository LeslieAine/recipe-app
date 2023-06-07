class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :foods

  validates :quantity, presence: { message: 'Quantity is required' },
                       numericality: { only_integer: true, greater__than_or_equal_to: 0 }
end
