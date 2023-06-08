require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  subject(:user) { User.new(name: 'User Name', email: 'manermidem@gmail.com') }

  let!(:recipe) do
    Recipe.create(name: 'Recipe Name', description: 'Recipe Description', public: true, preparation_time: 10,
                  cooking_time: 10, user_id: user.id)
  end

  let!(:food) do
    Food.create(name: 'Food Name', user_id: user.id, measurement_unit: 'KG', price: 10, quantity: 10)
  end

  let!(:recipe_food) do
    RecipeFood.create(recipe_id: recipe.id, food_id: food.id, quantity: 1)
  end

  before { recipe_food.save }

  describe 'Validations' do
    it 'is not valid without a recipe_id' do
      recipe_food.recipe_id = nil
      expect(recipe_food).to_not be_valid
    end

    it 'is not valid without a food_id' do
      recipe_food.food_id = nil
      expect(recipe_food).to_not be_valid
    end

    it 'is not valid with a recipe_id less than 0' do
      recipe_food.recipe_id = -1
      expect(recipe_food).to_not be_valid
    end

    it 'is not valid with a food_id less than 0' do
      recipe_food.food_id = -1
      expect(recipe_food).to_not be_valid
    end

    it 'is not valid with a recipe_id that does not exist' do
      recipe_food.recipe_id = 0
      expect(recipe_food).to_not be_valid
    end
  end
end
